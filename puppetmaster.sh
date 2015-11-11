#!/usr/bin/env sh
set -e

REPO_URL="https://github.com/iszak/puppet.git"
REPO_PATH="/etc/puppet"

# Prepare
rm -rf "$REPO_PATH"

# Git
sudo apt-get install git --yes

# Bundler
sudo apt-get install bundler

## Deploy
git clone --depth=1 "$REPO_URL" "$REPO_PATH"

## Modules
cd /etc/puppet/

bundle install --deployment

## Ensure latest versions
bundle exec librarian-puppet update
