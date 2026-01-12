#!/usr/bin/env bash

grim - | wl-copy --type image/png && wl-paste --type image/png > "$HOME/Pictures/screenshots/screenshot-$(date +%F_%T).png" && notify-send "Screenshot of the whole screen taken"
