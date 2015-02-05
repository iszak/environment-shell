#!/usr/bin/env sh

sudo apt-get install bundler --yes
sudo apt-get install git --yes

# Bundler
cd /vagrant/provisioners/puppet/

sudo -u vagrant -H bundle install --path=.bundle

# Puppet
cd /vagrant/provisioners/puppet/

sudo -u vagrant -H bundle exec librarian-puppet install
