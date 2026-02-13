#!/bin/bash

WALLPAPER_DIR="$HOME/Imagens/Wallpapers"
[ ! -d "$WALLPAPER_DIR" ] && exit 1

wallpapers=$(find "$WALLPAPER_DIR" -maxdepth 1 -type f \
    \( -iname "*.png" -o -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.gif" \) \
    | sort)

chosen=$(for img in $wallpapers; do
    name=$(basename "$img")
    echo -en "$name\0icon\x1f$img\n"
done | rofi -dmenu -p "Wallpaper" -theme-str 'element-icon { size: 64px; }' -theme $HOME/.config/rofi/themes/wallpaper_switcher.rasi)

[ -z "$chosen" ] && exit 0

wallpaper_path="$WALLPAPER_DIR/$chosen"
[ ! -f "$wallpaper_path" ] && exit 1

swww img --transition-type center --transition-pos 0,0 --transition-step 90 --transition-duration 1 --transition-fps 75 "$wallpaper_path"

exit 0
