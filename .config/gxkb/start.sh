#!/usr/bin/env bash
if [ -f /usr/bin/gxkb ]; then
    /usr/bin/killall gxkb
    /usr/bin/gxkb &
fi
