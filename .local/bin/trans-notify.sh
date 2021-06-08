#!/bin/sh
TEXT=$(xclip -selection primary -o)
TRANS=$("$LOCAL_BIN"/trans.sh :ru -brief "$TEXT")

/usr/bin/notify-send -u low "Перевод" "$TRANS"
