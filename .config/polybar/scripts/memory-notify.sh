#!/usr/bin/env bash
# Variables
MEM_ICON="󰽙"
MESSAGE_HEAD="Memory usage"
MESSAGE_BODY="$(ps -eo pid,cmd,%mem --sort=-%mem | head -n 11 | tail)"

case "$1" in
--send-notify)
    /usr/bin/notify-send "$MESSAGE_HEAD" "$MESSAGE_BODY"
    ;;
*)
    echo "$MEM_ICON"
    ;;
esac
