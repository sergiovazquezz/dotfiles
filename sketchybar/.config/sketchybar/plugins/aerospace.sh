#!/bin/bash

source "$HOME/.config/sketchybar/colors.sh"

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
    sketchybar --set $NAME background.color=$CAT_BLUE icon.color=$BLACK
else
    sketchybar --set $NAME background.color=$TRANSPARENT icon.color=$ICON_COLOR
fi
