#!/bin/bash

source "$HOME/.config/sketchybar/icons.sh"
source "$HOME/.config/sketchybar/colors.sh"

# Handle click events
if [[ "$SENDER" = "mouse.clicked" ]]; then
    # Use keyboard shortcut to toggle Focus Mode (Cmd+Option+Control+Shift+D)
    osascript -e 'tell application "System Events" to keystroke "d" using {command down, shift down, control down, option down}'

    sleep 0.5
fi

# Check Focus Mode visibility in Control Center
FOCUS_STATUS=$(defaults read com.apple.controlcenter "NSStatusItem Preferred Position FocusModes" 2>/dev/null || echo "0")

if [[ "$FOCUS_STATUS" != "0" ]]; then
    ICON=$DND_ON
    COLOR=$BLUE
else
    ICON=$DND_OFF
    COLOR=$WHITE
fi

sketchybar --set $NAME icon="$ICON" icon.color=$COLOR
