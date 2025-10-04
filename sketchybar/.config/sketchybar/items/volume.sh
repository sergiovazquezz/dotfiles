#!/bin/bash

volume_icon=(
    script="$PLUGIN_DIR/volume.sh"
    label.drawing=off
)

sketchybar --add item volume_icon right \
    --set volume_icon "${volume_icon[@]}" \
    --subscribe volume_icon volume_change
