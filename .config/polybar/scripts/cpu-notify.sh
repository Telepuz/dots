#!/usr/bin/env bash
# Variables
CPU_ICON="󰍛"
MESSAGE_HEAD="CPU usage"
MESSAGE_BODY="$(ps -eo pid,cmd,%cpu --sort=-%cpu | head -n 11 | tail)"

case "$1" in
--send-notify)
    /usr/bin/notify-send "$MESSAGE_HEAD" "$MESSAGE_BODY"
    ;;
*)
    echo "$CPU_ICON"
    ;;
esac
