#!/bin/bash

options="󰤆    Desligar\n    Reiniciar\n󰗽    Sair\n󰏦    Suspender\n    Bloquear\n󰤁    Hibernar"

chosen=$(echo -e "$options" | rofi -dmenu -p "Power Menu" -lines 6 -width 20 -theme $HOME/.config/rofi/themes/powermenu.rasi)

confirm() {
    echo -e "    Yes\n    No" | rofi -dmenu -p "Confirm $1?" -theme $HOME/.config/rofi/themes/powermenu_confirm.rasi
}

case "$chosen" in
    *Shutdown)
        if [[ $(confirm "󰤆    Shutdown") == "    Yes" ]]; then
            systemctl poweroff
        fi
        ;;
    *Reboot)
        if [[ $(confirm "    Reboot") == "    Yes" ]]; then
            systemctl reboot
        fi
        ;;
    *Logout)
        if [[ $(confirm "󰗽    Logout") == "    Yes" ]]; then
           niri msg action quit -s 
        fi
        ;;
    *Suspend)
        systemctl suspend
        ;;
    *Hibernate)
        systemctl hibernate
        ;;
    *Lock)
        swaylock
        ;;
esac

exit 0
