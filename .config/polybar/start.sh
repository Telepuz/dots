#!/usr/bin/env sh
# Terminate already running bar instances
/usr/bin/killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Check monitor config
[ ! -f "$XDG_CONFIG_HOME"/polybar/monitor.conf ] || touch "$XDG_CONFIG_HOME"/polybar/monitor.conf

# Launch
/usr/bin/polybar top &
