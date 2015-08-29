#!/usr/bin/env sh
set -e

# Install locale
apt-get install --yes language-pack-en

# Configure locale
dpkg-reconfigure --frontend=noninteractive locales
