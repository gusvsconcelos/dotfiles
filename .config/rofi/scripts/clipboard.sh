#!/usr/bin/env bash

cliphist list | rofi -dmenu -p "Clipboard" -display-columns 2 -theme $HOME/.config/rofi/themes/menu_no_icons.rasi | cliphist decode | wl-copy
