#!/usr/bin/env sh
set -e

sudo apt-get install git --yes
sudo gem install bundler

## Deploy
git clone --depth=1 https://github.com/iszak/environment-puppet.git /etc/puppet/

## Modules
cd /etc/puppet/

bundle install --deployment

## Ensure latest versions
bundle exec librarian-puppet update
