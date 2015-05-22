#!/usr/bin/env sh

sudo apt-get update --yes
sudo apt-get dist-upgrade --yes
sudo apt-get autoclean --yes
sudo apt-get autoremove --yes

# Add support for PPA
sudo apt-get install software-properties-common --yes

# Add support for Git
sudo apt-get install git --yes

# Install Puppetlabs Repository
wget https://apt.puppetlabs.com/puppetlabs-release-trusty.deb
sudo dpkg -i puppetlabs-release-trusty.deb

# Install Ruby Repository
sudo apt-add-repository ppa:brightbox/ruby-ng


# Update packages
sudo apt-get update

# Install puppet
sudo apt-get install puppet hiera facter

# Install Ruby 2.1
sudo apt-get install ruby2.1 ruby2.1-dev --yes

# Ruby 2.1 Default
update-alternatives --set ruby /usr/bin/ruby2.1
update-alternatives --set gem /usr/bin/gem2.1

# Install bundler
sudo gem install bundler --version=1.9.9

# Install librarian-puppet
sudo gem install librarian-puppet --version=2.1.0

# Hiera
sudo gem install deep_merge --version=1.0.1
sudo gem install msgpack --version=0.5.12

# Prepare
sudo rm -rf /etc/puppet/
sudo rm -rf /var/lib/hiera
sudo rm -f /etc/hiera.yaml

# Deploy
git clone --depth=1 https://github.com/iszak/environment-puppet.git /etc/puppet/environments/production/

# Symlink Hiera
ln -s /etc/puppet/hiera.yaml /etc/hiera.yaml

# Modules
cd /etc/puppet/environments/production/
librarian-puppet install

# Clean
rm puppetlabs-release-trusty.deb

# Configure locales
dpkg-reconfigure locales
