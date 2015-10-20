#!/usr/bin/env sh
set -e

# PPA tools
sudo apt-get install software-properties-common --yes

# PPA
sudo apt-add-repository ppa:brightbox/ruby-ng --yes
sudo apt-get update

# Ruby 2.1
sudo apt-get install ruby2.1 ruby2.1-dev --yes

# Ruby 2.1 default
update-alternatives --set ruby /usr/bin/ruby2.1
update-alternatives --set gem /usr/bin/gem2.1

# Bundler
sudo gem install bundler
