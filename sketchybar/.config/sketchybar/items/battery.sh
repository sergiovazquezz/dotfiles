#!/bin/bash

battery=(
    script="$PLUGIN_DIR/battery.sh"
    icon.font="$FONT5:Regular:17.5"
    label.drawing=on
    label.y_offset=-1
    update_freq=120
    updates=on
)

sketchybar --add item battery right \
    --set battery "${battery[@]}" \
    --subscribe battery power_source_change system_woke
