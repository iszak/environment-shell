#!/usr/bin/env sh
set -e

# Hiera
sudo apt-get install hiera --yes

# Clean
sudo rm -rf /var/lib/hiera
sudo rm -f /etc/hiera.yaml
