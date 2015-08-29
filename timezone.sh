#!/usr/bin/env sh
set -e

# Install timezones
sudo apt-get install tzdata --yes

# Set timezone
echo 'Etc/UTC' | sudo tee /etc/timezone

# Configure timezone
dpkg-reconfigure --frontend=noninteractive tzdata
