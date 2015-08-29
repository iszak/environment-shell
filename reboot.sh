#!/usr/bin/env sh
set -e

if [ -f /var/run/reboot-required ]; then
  reboot
fi
