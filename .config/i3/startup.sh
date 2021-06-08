#!/usr/bin/env bash
# Load Xresources
/usr/bin/xrdb "$XDG_CONFIG_HOME"/Xresources

# Start I3
if ! pgrep -x i3 > /dev/null; then
    [[ -d "$XDG_RUNTIME_DIR" ]] || mkdir -p "$XDG_RUNTIME_DIR"

    /bin/cat "$XDG_CONFIG_HOME"/i3/*.conf > "$XDG_CONFIG_HOME"/i3/config
    exec /usr/bin/i3
fi
