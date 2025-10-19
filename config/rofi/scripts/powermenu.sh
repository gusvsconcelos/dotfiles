#!/bin/bash

options=" Shutdown\n Reboot\n Logout\n Suspend\n Lock\n Hibernate"

chosen=$(echo -e "$options" | rofi -dmenu -p "Power Menu" -lines 6 -width 20)

confirm() {
    echo -e "Yes\nNo" | rofi -dmenu -p "Confirm $1?"
}

case "$chosen" in
    *Shutdown)
        if [[ $(confirm "Shutdown") == "Yes" ]]; then
            systemctl poweroff
        fi
        ;;
    *Reboot)
        if [[ $(confirm "Reboot") == "Yes" ]]; then
            systemctl reboot
        fi
        ;;
    *Logout)
        if [[ $(confirm "Logout") == "Yes" ]]; then
            hyprctl dispatch exit
        fi
        ;;
    *Suspend)
        systemctl suspend
        ;;
    *Hibernate)
        systemctl hibernate
        ;;
    *Lock)
        hyprlock
        ;;
esac

exit 0
