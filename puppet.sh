#!/usr/bin/env sh
set -e

# PPA
wget https://apt.puppetlabs.com/puppetlabs-release-trusty.deb
sudo dpkg -i puppetlabs-release-trusty.deb
rm puppetlabs-release-trusty.deb

sudo apt-get update

# Puppet
sudo apt-get install puppet --yes

# Build tools
apt-get install build-essential --yes

# Puppet / Hiera dependencies
sudo gem install ruby-shadow --version=2.4.1
sudo gem install deep_merge --version=1.0.1

# Clean
sudo rm -rf /etc/puppet/
sudo rm -rf /var/lib/hiera
sudo rm -f /etc/hiera.yaml
sudo rm -rf /etc/facter

mkdir -p /etc/facter/facts.d/
touch /etc/facter/facts.d/role.txt
