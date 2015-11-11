#!/usr/bin/env sh
set -e

REPO_URL="https://github.com/iszak/puppet.git"

FACTER_PATH="/etc/facter"
PUPPET_PATH="/etc/puppet"
HIERA_PATH="/etc/hiera.yaml"

# TODO: Check ruby 2.0+ installed
# TODO: Check bundle installed

# Librarian
sudo gem install librarian-puppet
sudo gem install bundler

# Puppet
# TODO: Check for ruby-shadow and ruby-deep-merge
# sudo gem install ruby-shadow
# sudo gem install deep_merge

sudo apt-get install git --yes

# Prepare
rm -rf "$PUPPET_PATH"
rm -rf "$FACTER_PATH"
rm -rf "$HIERA_PATH"

mkdir -p "$FACTER_PATH/facts.d"

# Puppet + Hiera code
git clone --depth=1 --recursive "$REPO_URL" "$PUPPET_PATH"

# Puppet Modules
cd /etc/puppet/

bundle install --deployment
bundle exec librarian-puppet update

# Puppet master
sudo apt-get install puppetmaster --yes

# Role
echo "role=puppetmaster" > "$FACTER_PATH/facts.d/role.txt"

# Puppet agent
sudo puppet agent --enable
