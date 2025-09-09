#!/bin/bash

# This script updates workspace icons when aerospace workspace changes
# It's triggered by aerospace through the exec-on-workspace-change hook

source "$HOME/.config/sketchybar/colors.sh"
source "$HOME/.config/sketchybar/icons.sh"

# Update workspace icons for all workspaces
windows_on_spaces() {
  args=()

  for workspace in $(aerospace list-workspaces --all); do
    # # Get all workspaces and clear any labels
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

    # Get the workspaces numbers
    args+=(--set space.$workspace label="" label.drawing=off label.background.drawing=off)
  done

  sketchybar -m "${args[@]}"
}

# Update workspace highlighting based on focused workspace
update_workspace_focus() {
  FOCUSED_WORKSPACE=${FOCUSED_WORKSPACE:-$(aerospace list-workspaces --focused)}
  PREV_WORKSPACE=${PREV_WORKSPACE:-""}

  args=()

  # Update highlighting for all workspaces (1-7)
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

# Run both updates
windows_on_spaces
update_workspace_focus
