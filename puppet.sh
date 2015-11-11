#!/usr/bin/env sh
set -e

# Puppet
sudo apt-get install puppet --yes

# Build tools
apt-get install build-essential --yes

# Puppet dependencies
sudo gem install ruby-shadow
sudo gem install deep_merge

# Clean
sudo rm -rf /etc/puppet/
