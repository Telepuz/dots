#!/usr/bin/env bash
# Variables
WIFI_ICON="󰖩"
MESSAGE_HEAD="WIFI info"
MESSAGE_BODY="$(iw wlp59s0 link | tail -10 |tr -d '\t')"
WIFI_SIGNAL="$(awk 'NR==3 {print $3}' /proc/net/wireless | tr -d '.')"

case "$1" in
--send-notify)
    /usr/bin/notify-send "$MESSAGE_HEAD" "$MESSAGE_BODY"
    ;;
*)
    if [[ $(iw wlp59s0 link) == 'Not connected.' ]]; then
        echo "$WIFI_ICON -"
    else
        echo "$WIFI_ICON $WIFI_SIGNAL%"
    fi
    ;;
esac
