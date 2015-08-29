#!/usr/bin/env sh
set -e

echo $SSH_KEY

if [ ! -d "/root/.ssh/" ]; then
    mkdir "/root/.ssh/";
fi

echo "$SSH_KEY" >> "/root/.ssh/authorized_keys"
