#!/bin/bash

source "$HOME/.config/sketchybar/icons.sh"
source "$HOME/.config/sketchybar/colors.sh"

# Handle click events
if [[ "$SENDER" = "mouse.clicked" ]]; then
  # Use keyboard shortcut to toggle Focus Mode (Cmd+Option+Control+Shift+D)
  osascript -e 'tell application "System Events" to keystroke "d" using {command down, shift down, control down, option down}'

  # Wait a moment for the system to update, then refresh
  sleep 0.5
fi

# Check Focus Mode visibility in Control Center
FOCUS_STATUS=$(defaults read com.apple.controlcenter "NSStatusItem Visible FocusModes" 2>/dev/null || echo "0")

if [[ "$FOCUS_STATUS" = "1" ]]; then
  ICON=$DND_ON
  COLOR=$BLUE
else
  ICON=$DND_OFF
  COLOR=$GREY
fi

sketchybar --set $NAME icon="$ICON" icon.color=$COLOR
