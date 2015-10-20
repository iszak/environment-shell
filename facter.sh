#!/usr/bin/env sh
set -e

# Facter
sudo apt-get install facter --yes

# Clean
sudo rm -rf /etc/facter

mkdir -p /etc/facter/facts.d/
touch /etc/facter/facts.d/role.txt
