#!/bin/bash

source "$HOME/.config/sketchybar/colors.sh"

CURRENT_WIFI=$(ipconfig getsummary en0)
SSID="$(echo "$CURRENT_WIFI" | grep -o "SSID : .*" | sed 's/^SSID : //' | tail -n 1)"

# Available symbols: 􀙥  􀙇  􀙈  􀉤  􀐿  􀐾  􀇲  􀆼  􀞙
if [[ $SSID = "Ebrietas" ]]; then
  ICON=􀉤
elif [[ $SSID != "" ]]; then
  ICON=􀙇
elif [[ $CURRENT_WIFI = "AirPort: Off" ]]; then
  ICON=􀙈
else
  ICON=􀙈
fi

render_bar_item() {
  sketchybar --set $NAME \
    icon.color=$WHITE \
    icon=$ICON \
    label=$SSID \
    label.drawing=off \
    drawing=on
}

update() {
  render_bar_item
}

case "$SENDER" in
"routine" | "forced")
  update
  ;;
esac
