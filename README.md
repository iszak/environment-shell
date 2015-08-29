```
#!/usr/bin/env sh
USERDATA_PATH="/tmp/userdata.sh"
USERDATA_LOG="/var/log/userdata.log"

# Download
wget --output-document="$USERDATA_PATH" https://raw.githubusercontent.com/iszak/environment-shell/master/userdata.sh

# Permission
chmod +x "$USERDATA_PATH"

# Run
"$USERDATA_PATH" > "$USERDATA_LOG"

# Clean
rm "$USERDATA_PATH"

# Guide
echo "Add private.yaml and run sudo puppet apply /etc/puppet/manifests/default.pp"
```
