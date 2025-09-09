#!/bin/bash

dnd=(
  script="$PLUGIN_DIR/dnd.sh"
  label.drawing=off
  padding_left=10
  update_freq=5
  updates=on
  click_script="$PLUGIN_DIR/dnd.sh"
)

sketchybar --add item dnd right \
  --set dnd "${dnd[@]}" \
  --subscribe dnd mouse.clicked
