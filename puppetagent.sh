#!/usr/bin/env sh
set -e

REPO_URL="https://github.com/iszak/puppet-agent.git"
REPO_PATH="/etc/puppet"

# Prepare
rm -rf "$REPO_PATH"

## Deploy
git clone --depth=1 "$REPO_URL" "$REPO_PATH"
