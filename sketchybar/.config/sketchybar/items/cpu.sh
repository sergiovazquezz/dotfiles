#!/bin/bash

cpu=(
  icon=$CPU
  icon.color=$AQUA
  label.drawing=on
  label.color=$LABEL_COLOR
  padding_left=10
  update_freq=5
  updates=on
  script="$PLUGIN_DIR/cpu.sh"
)

sketchybar --add item cpu right \
  --set cpu "${cpu[@]}"
