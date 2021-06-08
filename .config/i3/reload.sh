#!/usr/bin/env sh
# Reload config
/bin/cat "$XDG_CONFIG_HOME"/i3/*.conf > "$XDG_CONFIG_HOME"/i3/config

# Restart polybar
/usr/bin/killall -q polybar
"$XDG_CONFIG_HOME"/polybar/start.sh

# Reload xresources
/usr/bin/xrdb "$XDG_CONFIG_HOME"/Xresources

# Reload
/usr/bin/i3-msg reload
