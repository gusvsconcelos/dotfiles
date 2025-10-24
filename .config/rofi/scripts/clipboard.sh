#!/usr/bin/env bash

cliphist list | rofi -dmenu -p "Clipboard" -theme $HOME/.config/rofi/themes/menu_no_icons.rasi | cliphist decode | wl-copy
