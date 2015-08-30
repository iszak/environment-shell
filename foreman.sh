#!/usr/bin/env sh
set -e

# Install CA certificates
apt-get install --yes ca-certificates

# Add foreman resource
echo "deb http://deb.theforeman.org/ trusty 1.9" > /etc/apt/sources.list.d/foreman.list
echo "deb http://deb.theforeman.org/ plugins 1.9" >> /etc/apt/sources.list.d/foreman.list

# Add foreman key
wget -q http://deb.theforeman.org/pubkey.gpg -O- | apt-key add -

# Update packages
apt-get update

# Install foreman installer
apt-get install --yes foreman-installer

# Set hostname
echo 'foreman.iszak.net' > /etc/foreman
hostname 'foreman.iszak.net'

# Install foreman
foreman-installer --enable-foreman-plugin-digitalocean \
\
                  --foreman-admin-email="iszak.bryan@gmail.com" \
                  --foreman-admin-first-name="Iszak" \
                  --foreman-admin-last-name="Bryan" \
                  --foreman-admin-username="iszak"
