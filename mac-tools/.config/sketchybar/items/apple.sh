#!/bin/bash

apple=(
    script="$PLUGIN_DIR/apple.sh"
    icon.font="$FONT5:Bold:14"
    icon.y_offset=1.9
)

sketchybar --add item apple left \
    --set apple "${apple[@]}"
