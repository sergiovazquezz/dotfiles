#!/usr/bin/env bash

# Options with icons
lock=' Lock'
logout=' Logout'
suspend=' Suspend'
reboot=' Reboot'
shutdown=' Shutdown'

# Main menu
chosen=$(echo -e "$lock\\n$logout\\n$suspend\\n$reboot\\n$shutdown" | fuzzel --dmenu \
    --prompt="Power: " \
    --width=20 \
    --lines=5)

# Confirmation dialog
confirm() {
    result=$(echo -e "Yes\\nNo" | fuzzel --dmenu \
        --prompt="Are you sure? " \
        --width=15 \
        --lines=2)
    [[ "$result" == "Yes" ]]
}

# Execute based on choice
case $chosen in
    "$shutdown")
        confirm && systemctl poweroff
        ;;
    "$reboot")
        confirm && systemctl reboot
        ;;
    "$lock")
        if command -v hyprlock &>/dev/null; then
            hyprlock
        elif command -v swaylock &>/dev/null; then
            swaylock
        fi
        ;;
    "$suspend")
        if confirm; then
            loginctl lock-session
            sleep 0.5
            systemctl suspend
        fi
        ;;
    "$logout")
        if confirm; then
            if [[ "$XDG_CURRENT_DESKTOP" == "niri" ]]; then
                niri msg action quit
            elif [[ "$XDG_CURRENT_DESKTOP" == "Hyprland" ]]; then
                hyprctl dispatch exit
            fi
        fi
        ;;
esac
