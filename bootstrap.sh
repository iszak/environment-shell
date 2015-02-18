#!/usr/bin/env sh

# Apt
sudo apt-get update

# Bundler
cd /vagrant/provisioners/puppet/

sudo -u vagrant -H bundle install --path=.bundle

# Puppet
cd /vagrant/provisioners/puppet/

sudo -u vagrant -H bundle exec librarian-puppet install
