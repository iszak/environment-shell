```
#!/usr/bin/env sh
TMP_DIR=$(mktemp -d)
LOG_PATH="/var/log/userdata.log"

# Create directory
mkdir -p "$TMP_DIR"

sudo apt-get install unzip --yes

# Download
wget --output-document="$TMP_DIR/master.zip" https://github.com/iszak/environment-shell/archive/master.zip

# Extract
unzip master.zip -d "$TMP_DIR"

# Run
"$TMP_DIR/userdata.sh" > "$LOG_PATH"

# Clean
rm -r "$TMP_DIR"

# Guide
echo "Add private.yaml and run sudo puppet apply /etc/puppet/manifests/default.pp"
```
