#!/bin/bash

options="󰤆    Desligar\n    Reiniciar\n󰗽    Sair\n    Bloquear\n󰤁    Hibernar\n󰏦    Suspender"

chosen=$(echo -e "$options" | rofi -dmenu -p "Power Menu" -lines 6 -width 20 -theme $HOME/.config/rofi/themes/powermenu.rasi)

confirm() {
    echo -e "    Sim\n    Não" | rofi -dmenu -p "Confirm $1?" -theme $HOME/.config/rofi/themes/powermenu_confirm.rasi
}

case "$chosen" in
    *Desligar)
        if [[ $(confirm "󰤆    Desligar") == "    Sim" ]]; then
            systemctl poweroff --no-wall
        fi
        ;;
    *Reiniciar)
        if [[ $(confirm "    Reiniciar") == "    Sim" ]]; then
            systemctl reboot --no-wall
        fi
        ;;
    *Sair)
        if [[ $(confirm "󰗽    Sair") == "    Sim" ]]; then
            niri msg action quit -s
        fi
        ;;
    *Suspender)
        systemctl suspend
        ;;
    *Hibernar)
        systemctl hibernate
        ;;
    *Bloquear)
        swaylock
        ;;
esac

exit 0
