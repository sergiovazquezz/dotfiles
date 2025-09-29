#!/bin/bash

ram=(
    icon=
    icon.font="JetBrainsMono Nerd Font:Semibold:15"
    label.drawing=on
    label.color=$LABEL_COLOR
    updates=on
    update_freq=5
    script="$PLUGIN_DIR/ram.sh"
)

sketchybar --add item ram right \
    --set ram "${ram[@]}"
