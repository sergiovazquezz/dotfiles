#!/bin/bash

POPUP_OFF="sketchybar --set wifi popup.drawing=off"

# Define menu defaults that were missing
menu_defaults=(
  padding_left=5
  padding_right=5
  background.corner_radius=6
  popup.background.border_width=2
  popup.background.corner_radius=6
)

menu_item_defaults=(
  padding_left=5
  padding_right=5
  icon.padding_right=5
  background.corner_radius=6
)

wifi=(
  "${menu_defaults[@]}"
  icon.padding_right=0
  label.drawing=off
  popup.align=right
  update_freq=5
  script="$PLUGIN_DIR/wifi.sh"
)

sketchybar \
  --add item wifi right \
  --set wifi "${wifi[@]}" \
  --subscribe wifi wifi_change mouse.clicked mouse.exited mouse.exited.global \
  --add item wifi.ssid popup.wifi \
  --set wifi.ssid icon=􁓣 \
  label="SSID" \
  "${menu_item_defaults[@]}" \
  click_script="open 'x-apple.systempreferences:com.apple.preference.network?Wi-Fi';$POPUP_OFF" \
  --add item wifi.ipaddress popup.wifi \
  --set wifi.ipaddress icon=􀆪 \
  label="IP Address" \
  "${menu_item_defaults[@]}" \
  click_script="echo \"$IP_ADDRESS\"|pbcopy;$POPUP_OFF"
