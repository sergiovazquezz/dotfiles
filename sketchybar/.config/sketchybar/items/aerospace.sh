#!/bin/bash

sketchybar --add event aerospace_workspace_change

source "$HOME/.config/sketchybar/colors.sh"

for sid in $(aerospace list-workspaces --all); do
    sketchybar --add item space.$sid left \
        --subscribe space.$sid aerospace_workspace_change \
        --set space.$sid \
        icon.font="$FONT:Semibold:16" \
        label.drawing=off \
        padding_left=0 \
        padding_right=0 \
        icon.padding_right=12 \
        icon.padding_left=12 \
        background.color=$ITEM_BG_COLOR \
        background.corner_radius=6 \
        background.drawing=off \
        icon="$sid" \
        icon.color=$ICON_COLOR \
        click_script="aerospace workspace $sid" \
        script="$PLUGIN_DIR/aerospace.sh $sid"
done
