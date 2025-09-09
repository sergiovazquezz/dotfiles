#!/bin/bash

window_state() {
  source "$HOME/.config/sketchybar/colors.sh"
  source "$HOME/.config/sketchybar/icons.sh"

  # Get current workspace
  WORKSPACE=$(aerospace list-workspaces --focused)

  args=()
  args+=(--set $NAME label.drawing=off)

  # For now, just show the tiling icon since aerospace doesn't have easy layout detection
  # Users can click to toggle floating if needed
  args+=(--set $NAME icon=$AEROSPACE_GRID icon.color=$ORANGE)

  sketchybar -m "${args[@]}"
}

windows_on_spaces() {
  args=()

  for workspace in $(aerospace list-workspaces --all); do
    # # Get all workspaces and their windows
    # icon_strip=" "
    # # Get apps in this workspace - extract app name from "window_id | app_name | window_title" format
    # apps=$(aerospace list-windows --workspace $workspace | cut -d'|' -f2 | sed 's/^ *//; s/ *$//' | sort -u)
    # if [ "$apps" != "" ]; then
    #   while IFS= read -r app; do
    #     if [ "$app" != "" ]; then
    #       icon_strip+=" $($HOME/.config/sketchybar/plugins/icon_map.sh "$app")"
    #     fi
    #   done <<< "$apps"
    #   # Show label with background when workspace has apps
    #   args+=(--set space.$workspace label="$icon_strip" label.drawing=on label.background.drawing=on)
    # else
    #   # Hide label and background when workspace is empty
    #   args+=(--set space.$workspace label="" label.drawing=off label.background.drawing=off)
    # fi

    # Get the workspaces
    args+=(--set space.$workspace label="" label.drawing=off label.background.drawing=off)
  done

  sketchybar -m "${args[@]}"
}

mouse_clicked() {
  # Toggle floating layout for current workspace
  aerospace layout floating tiling
  window_state
}

update_workspace_focus() {
  FOCUSED_WORKSPACE=$(aerospace list-workspaces --focused)

  args=()

  # Update highlighting for all workspaces
  for workspace in $(aerospace list-workspaces --all); do
    if [ "$workspace" = "$FOCUSED_WORKSPACE" ]; then
      args+=(--set space.$workspace icon.highlight=on)
    else
      args+=(--set space.$workspace icon.highlight=off)
    fi
  done

  if [ ${#args[@]} -gt 0 ]; then
    sketchybar -m "${args[@]}"
  fi
}

case "$SENDER" in
"mouse.clicked")
  mouse_clicked
  ;;
"forced")
  exit 0
  ;;
"window_focus")
  window_state
  ;;
"windows_on_spaces")
  windows_on_spaces
  update_workspace_focus
  ;;
"aerospace_workspace_change")
  windows_on_spaces
  update_workspace_focus
  ;;
esac
