#!/bin/bash

wifi=(
    label.drawing=off
    update_freq=5
    script="$PLUGIN_DIR/wifi.sh"
)

sketchybar \
    --add item wifi right \
    --set wifi "${wifi[@]}"
