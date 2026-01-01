#!/bin/bash

sketchybar --add event aerospace_workspace_change

source "$HOME/.config/sketchybar/colors.sh"

for sid in $(aerospace list-workspaces --all); do
  sketchybar --add item space.$sid left \
    --subscribe space.$sid aerospace_workspace_change \
    --set space.$sid \
    icon.font="$FONT6:Bold:16" \
    label.drawing=off \
    padding_left=3 \
    padding_right=3 \
    icon.padding_right=9 \
    icon.padding_left=9 \
    background.color=$TRANSPARENT \
    background.corner_radius=6 \
    background.height=25 \
    background.drawing=off \
    icon="$sid" \
    icon.color=$ICON_COLOR \
    click_script="aerospace workspace $sid" \
    script="$PLUGIN_DIR/aerospace.sh $sid"
done
