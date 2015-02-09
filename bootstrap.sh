#!/usr/bin/env sh

# Bundler
cd /vagrant/provisioners/puppet/

sudo -u vagrant -H bundle install --path=.bundle

# Puppet
cd /vagrant/provisioners/puppet/

sudo -u vagrant -H bundle exec librarian-puppet install
