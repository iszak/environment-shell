#!/usr/bin/env sh
set -e

# Git
sudo apt-get install git --yes

# Bundler
sudo gem install bundler

# Librarian-puppet
sudo gem install librarian-puppet

## Deploy
git clone --depth=1 https://github.com/iszak/environment-puppet.git /etc/puppet/

## Modules
cd /etc/puppet/

bundle install --deployment

## Ensure latest versions
bundle exec librarian-puppet update
