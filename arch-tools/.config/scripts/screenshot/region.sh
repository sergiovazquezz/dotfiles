#!/usr/bin/env bash

REGION=$(slurp) || exit; grim -g "$REGION" - | wl-copy && wl-paste > ~/Pictures/screenshots/screenshot-$(date +%F_%T).png && notify-send "Screenshot of region taken"
