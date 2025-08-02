#!/bin/bash

# Loads defined colors
source "$HOME/.config/sketchybar/colors.sh"

getcolor() {
  case $1 in
  "white")
    if [ "$2" ]; then
      echo "$GREY" # dimmed white
    else
      echo "$WHITE"
    fi
    ;;
  *)
    echo "$WHITE"
    ;;
  esac
}

# Define missing HIGHLIGHT variable
HIGHLIGHT=$BLUE

# Check VPN status
IS_VPN="Disconnected"

# Check for Cloudflare WARP
if [[ -x "/usr/local/bin/warp-cli" ]]; then
  WARP_STATUS=$(/usr/local/bin/warp-cli status 2>/dev/null | grep "Status update:")
  if [[ $WARP_STATUS =~ Connected ]]; then
    IS_VPN="Connected"
  fi
fi
# CURRENT_WIFI="$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I)"
CURRENT_WIFI="$(ipconfig getsummary en0)"
IP_ADDRESS="$(ipconfig getifaddr en0)"
# IP_ADDRESS="$(echo "$CURRENT_WIFI" | grep -o "ciaddr = .*" | sed 's/^ciaddr = //')"
SSID="$(echo "$CURRENT_WIFI" | grep -o "SSID : .*" | sed 's/^SSID : //' | tail -n 1)"
# CURR_TX="$(echo "$CURRENT_WIFI" | grep -o "lastTxRate: .*" | sed 's/^lastTxRate: //')"

# VPN and WiFi icon logic
# Available symbols: 􀙥  􀙇  􀙈  􀉤  􀐿  􀐾  􀇲  􀆼  􀞙
if [[ $IS_VPN != "Disconnected" ]]; then
  # ICON_COLOR=$HIGHLIGHT
  ICON_COLOR=$(getcolor white)
  ICON=􁅏
elif [[ $SSID = "Ebrietas" ]]; then
  ICON_COLOR=$(getcolor white)
  ICON=􀉤
elif [[ $SSID != "" ]]; then
  ICON_COLOR=$(getcolor white)
  ICON=􀙇
elif [[ $CURRENT_WIFI = "AirPort: Off" ]]; then
  ICON_COLOR=$(getcolor white 25)
  ICON=􀙈
else
  ICON_COLOR=$(getcolor white 25)
  ICON=􀙈
fi

render_bar_item() {
  DRAWING=$([ "$(cat /tmp/sketchybar_sender 2>/dev/null)" == "focus_on" ] && echo "off" || echo "on")
  sketchybar --set $NAME \
    icon.color=$ICON_COLOR \
    icon=$ICON \
    drawing=$DRAWING
}

render_popup() {
  if [ "$SSID" != "" ]; then
    args=(
      --set wifi.ssid label="$SSID"
      --set wifi.ipaddress label="$IP_ADDRESS"
      click_script="printf $IP_ADDRESS | pbcopy;sketchybar --set wifi popup.drawing=toggle"
    )
  else
    args=(
      --set wifi.ssid label="Not connected"
      --set wifi.ipaddress label="No IP"
    )
  fi

  sketchybar "${args[@]}" >/dev/null
}

update() {
  render_bar_item
  render_popup
}

popup() {
  sketchybar --set "$NAME" popup.drawing="$1"
}

case "$SENDER" in
"routine" | "forced")
  update
  ;;
"mouse.clicked")
  popup toggle
  ;;
esac
