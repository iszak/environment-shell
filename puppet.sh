#!/usr/bin/env sh
set -e

# Puppet
sudo apt-get install puppet --yes

# Build tools
apt-get install build-essential --yes

# Puppet dependencies
sudo apt-get install ruby-deep-merge --yes
sudo apt-get install ruby-shadow --yes

# Clean
sudo rm -rf /etc/puppet/
