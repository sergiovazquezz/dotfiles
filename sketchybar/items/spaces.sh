#!/bin/bash

SPACE_ICONS=("1" "2" "3" "4" "5" "6" "7")

# Create space items that only show numbers
sid=0
spaces=()
for i in "${!SPACE_ICONS[@]}"; do
  sid=$(($i + 1))

  space=(
    icon=${SPACE_ICONS[i]}
    icon.padding_right=20
    icon.highlight_color=$RED
    icon.font="$FONT:Bold:16.0"
    script="$PLUGIN_DIR/space.sh"
  )

  sketchybar --add item space.$sid left \
    --set space.$sid "${space[@]}" \
    --subscribe space.$sid mouse.clicked
done

spaces=(
  background.color=$BACKGROUND_1
  background.border_color=$BACKGROUND_2
  background.border_width=1
  background.drawing=on
)

sketchybar --add bracket spaces '/space\..*/' \
  --set spaces "${spaces[@]}"
