#!/bin/bash

calendar=(
    padding_right=0
    update_freq=30
    icon.drawing=off
    label.padding_left=10
    label.font="$FONT6:Bold:13.5"
    script="$PLUGIN_DIR/calendar.sh"
)

sketchybar --add item calendar right \
    --set calendar "${calendar[@]}" \
    --subscribe calendar system_woke
