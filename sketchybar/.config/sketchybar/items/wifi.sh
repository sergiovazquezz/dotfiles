#!/bin/bash

wifi=(
  padding_left=10
  icon.padding_right=0
  label.drawing=off
  update_freq=5
  script="$PLUGIN_DIR/wifi.sh"
)

sketchybar \
  --add item wifi right \
  --set wifi "${wifi[@]}"
