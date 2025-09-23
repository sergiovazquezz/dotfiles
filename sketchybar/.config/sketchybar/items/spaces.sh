#!/bin/bash

SPACE_ICONS=("1" "2" "3" "4" "5" "6")
SPACE_FONT="JetBrainsMono Nerd Font"

# Create space items that only show numbers
sid=0
spaces=()
for i in "${!SPACE_ICONS[@]}"; do
    sid=$(($i + 1))

    # Check if icon starts with ":" to determine if it's an app font icon
    if [[ ${SPACE_ICONS[i]} == :* ]]; then
        icon_font="sketchybar-app-font:Regular:16.0"
    else
        icon_font="$SPACE_FONT:Semibold:16.5"
    fi

    space=(
        icon=${SPACE_ICONS[i]}
        icon.padding_right=10
        icon.padding_left=10
        icon.highlight_color=$RED
        icon.font="$icon_font"
        script="$PLUGIN_DIR/space.sh"
    )

    sketchybar --add item space.$sid left \
        --set space.$sid "${space[@]}" \
        --subscribe space.$sid mouse.clicked
done

spaces=(
    background.color=$BOX_BACKGROUND
    background.corner_radius=8
    background.drawing=on
)

sketchybar --add bracket spaces '/space\..*/' \
    --set spaces "${spaces[@]}"
