#!/bin/bash

ram=(
  icon=$RAM
  icon.color=$AQUA
  label.drawing=on
  label.color=$LABEL_COLOR
  updates=on
  update_freq=5
  padding_left=10
  padding_right=10
  script="$PLUGIN_DIR/ram.sh"
)

sketchybar --add item ram right \
  --set ram "${ram[@]}"
