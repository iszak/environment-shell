#!/usr/bin/env sh
set -e

# Build tools
apt-get install build-essential --yes

# Host kernels modules update
apt-get install dkms --yes

# Mount ISO
mount -o loop VBoxGuestAdditions.iso /mnt

# Install the VirtualBox guest additions
yes | sh /mnt/VBoxLinuxAdditions.run

# Unmount
umount /mnt

# Clean up
rm VBoxGuestAdditions.iso
