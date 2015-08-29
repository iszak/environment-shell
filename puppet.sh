#!/usr/bin/env sh
set -e

wget https://apt.puppetlabs.com/puppetlabs-release-trusty.deb
sudo dpkg -i puppetlabs-release-trusty.deb
rm puppetlabs-release-trusty.deb

sudo apt-get update

sudo apt-get install build-essential --yes
sudo apt-get install git --yes

sudo apt-get install puppet --yes

sudo gem install deep_merge --version=1.0.1
sudo gem install ruby-shadow --version=2.4.1
sudo gem install librarian-puppet --version=2.2.1

sudo rm -rf /etc/puppet/
sudo rm -rf /var/lib/hiera
sudo rm -f /etc/hiera.yaml
sudo rm -rf /etc/facter

mkdir -p /etc/facter/facts.d/
touch /etc/facter/facts.d/role.txt
