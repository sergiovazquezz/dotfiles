#!/bin/bash

volume_icon=(
  script="$PLUGIN_DIR/volume.sh"
  padding_left=10
  padding_right=5
  label.align=left
  label.drawing=off
  label.font="$FONT:Regular:14.0"
)

status_bracket=(
  background.color=$BACKGROUND_1
  background.border_color=$BACKGROUND_2
  background.border_width=2
)

sketchybar --add item volume_icon right \
  --set volume_icon "${volume_icon[@]}" \
  --subscribe volume_icon volume_change

sketchybar --add bracket status battery volume_icon \
  --set status "${status_bracket[@]}"
