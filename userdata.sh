#!/usr/bin/env sh
set -e

./upgrade.sh

./timezone.sh
./locale.sh

./ruby.sh
./puppet.sh
./hiera.sh
./facter.sh

./puppetmaster.sh

./reboot.sh
