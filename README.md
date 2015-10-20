```
#!/usr/bin/env sh
TMP_DIR=$(mktemp -d)
LOG_PATH="/var/log/userdata.log"

REPO_HOST="github.com"
REPO_USER="iszak"
REPO_NAME="shell"

# Create log
touch "$LOG_PATH"

# Create directory
mkdir -p "$TMP_DIR"

# Download
wget --directory-prefix="$TMP_DIR" "https://$REPO_HOST/$REPO_USER/$REPO_NAME/archive/master.tar.gz"

# Extract
tar --extract --gzip --file "$TMP_DIR/master.tar.gz" --directory "$TMP_DIR"

# CWD
cd "$TMP_DIR/$REPO_NAME-master/"

# Run
./upgrade.sh >> "$LOG_PATH"
./timezone.sh >> "$LOG_PATH"
./locale.sh >> "$LOG_PATH"

# Clean
rm -r "$TMP_DIR"

# Guide
echo "Add private.yaml and run sudo puppet apply /etc/puppet/manifests/default.pp"
```
