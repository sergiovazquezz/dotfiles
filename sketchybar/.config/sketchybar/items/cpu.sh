#!/bin/bash

cpu=(
  icon=􀧓
  icon.color=$AQUA
  label.drawing=on
  label.color=$LABEL_COLOR
  update_freq=10
  updates=on
  script="$PLUGIN_DIR/cpu.sh"
)

sketchybar --add item cpu right \
  --set cpu "${cpu[@]}"
