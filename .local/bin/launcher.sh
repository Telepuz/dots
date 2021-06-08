#!/usr/bin/env bash
ROFI_STYLE="style_square"
ICON_DRUN=""

/usr/bin/rofi -show drun \
    -theme ~/.config/rofi/"$ROFI_STYLE".rasi \
    -display-drun "$ICON_DRUN" \
    -run-shell-command '{terminal} -e \\" {cmd}; read -n 1 -s\\"'
