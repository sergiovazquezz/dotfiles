#!/bin/bash

apple=(
    script="$PLUGIN_DIR/apple.sh"
    icon.font="$FONT:Bold:16"
)

sketchybar --add item apple left \
    --set apple "${apple[@]}"
