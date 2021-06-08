#!/usr/bin/env zsh
source "$HOME"/.config/shell/.zprofile
for CONFIG ("$XDG_CONFIG_HOME"/shell/zsh.d/*.{sh,zsh}) [ -f "$CONFIG" ] && source "$CONFIG"
