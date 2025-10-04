#!/bin/bash

source "$HOME/.config/sketchybar/colors.sh"

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
    sketchybar --set $NAME icon.color=$TEST
else
    sketchybar --set $NAME icon.color=$ICON_COLOR
fi
