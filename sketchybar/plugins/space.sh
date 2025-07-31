#!/bin/bash

update() {
  # Extract workspace number from the item name (space.1 -> 1)
  WORKSPACE_NUM=${NAME#space.}
  FOCUSED_WORKSPACE=$(aerospace list-workspaces --focused)

  # Check if this workspace is focused
  if [ "$WORKSPACE_NUM" = "$FOCUSED_WORKSPACE" ]; then
    sketchybar --set $NAME icon.highlight=on
  else
    sketchybar --set $NAME icon.highlight=off
  fi
}

mouse_clicked() {
  # Extract workspace number from the item name (space.1 -> 1)
  WORKSPACE_NUM=${NAME#space.}

  if [ "$BUTTON" = "right" ]; then
    # For right click, just focus the workspace (aerospace doesn't support destroying)
    aerospace workspace $WORKSPACE_NUM 2>/dev/null
  else
    aerospace workspace $WORKSPACE_NUM 2>/dev/null
  fi

  # Update all workspace highlights
  sketchybar --trigger aerospace_workspace_change
}

case "$SENDER" in
  "mouse.clicked") mouse_clicked
  ;;
  *) update
  ;;
esac
