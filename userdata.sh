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
rm puppetlabs-release-trusty.deb

# Install Ruby Repository
sudo apt-add-repository ppa:brightbox/ruby-ng --yes


# Update packages
sudo apt-get update

# Install puppet
sudo apt-get install puppet --yes

# Install Ruby 2.1
sudo apt-get install ruby2.1 ruby2.1-dev --yes

# Ruby 2.1 Default
update-alternatives --set ruby /usr/bin/ruby2.1
update-alternatives --set gem /usr/bin/gem2.1

# Install bundler
sudo gem install bundler --version=1.10.4

# Hiera
sudo gem install deep_merge --version=1.0.1

# Prepare
sudo rm -rf /etc/puppet/
sudo rm -rf /var/lib/hiera
sudo rm -f /etc/hiera.yaml

# Deploy
git clone --depth=1 https://github.com/iszak/environment-puppet.git /etc/puppet/

# Modules
cd /etc/puppet/

bundle install --deployment
bundle exec librarian-puppet install

# Configure locales
dpkg-reconfigure locales

# Guide
echo "Add private.yaml and run sudo puppet apply /etc/puppet/manifests/default.pp"
