```
#!/usr/bin/env sh
TMP_DIR=$(mktemp -d)
LOG_PATH="/var/log/userdata.log"

# Create directory
mkdir -p "$TMP_DIR"

# Download
wget --directory-prefix="$TMP_DIR" https://github.com/iszak/environment-shell/archive/master.tar.gz

# Extract
tar --extract --gzip --file "$TMP_DIR/master.tar.gz" --directory "$TMP_DIR"

# Run
"$TMP_DIR/environment-shell-master/userdata.sh" > "$LOG_PATH"

# Clean
rm -r "$TMP_DIR"

# Guide
echo "Add private.yaml and run sudo puppet apply /etc/puppet/manifests/default.pp"
```
