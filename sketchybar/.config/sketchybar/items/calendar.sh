#!/bin/bash

calendar=(
    icon.font="$FONT:Regular:13.4"
    padding_left=10
    icon.padding_right=0
    padding_right=0
    update_freq=30
    script="$PLUGIN_DIR/calendar.sh"
)

sketchybar --add item calendar right \
    --set calendar "${calendar[@]}" \
    --subscribe calendar system_woke
