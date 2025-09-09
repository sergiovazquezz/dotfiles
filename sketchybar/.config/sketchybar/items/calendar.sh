#!/bin/bash

calendar=(
  icon.font="$FONT:Semibold:13.0"
  label.font="$FONT:Semibold:13.0"
  padding_left=10
  update_freq=30
  script="$PLUGIN_DIR/calendar.sh"
)

sketchybar --add item calendar right \
  --set calendar "${calendar[@]}" \
  --subscribe calendar system_woke
