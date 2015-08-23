```
#!/usr/bin/env sh
USERDATA_PATH="/tmp/userdata.sh"
USERDATA_LOG="/var/log/userdata.log"

wget --output-document="$USERDATA_PATH" https://raw.githubusercontent.com/iszak/environment-shell/master/userdata.sh
chmod +x "$USERDATA_PATH"
"$USERDATA_PATH" > "$USERDATA_LOG"
```
