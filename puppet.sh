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

# Puppet dependencies
sudo gem install ruby-shadow
sudo gem install deep_merge

# Clean
sudo rm -rf /etc/puppet/
