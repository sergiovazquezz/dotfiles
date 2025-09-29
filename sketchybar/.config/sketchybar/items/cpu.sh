#!/bin/bash

cpu=(
    icon=$CPU
    label.drawing=on
    label.padding_right=3
    update_freq=5
    updates=on
    script="$PLUGIN_DIR/cpu.sh"
)

sketchybar --add item cpu right \
    --set cpu "${cpu[@]}"
