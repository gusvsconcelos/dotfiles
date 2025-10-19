#!/bin/bash

WALLPAPER_DIR="$HOME/Imagens/Wallpapers"
CONFIG_FILE="$HOME/.config/hypr/hyprpaper.conf"

[ ! -d "$WALLPAPER_DIR" ] && exit 1

wallpapers=$(find "$WALLPAPER_DIR" -maxdepth 1 -type f \( -iname "*.png" -o -iname "*.jpg" -o -iname "*.jpeg" \))

[ -z "$wallpapers" ] && exit 1

chosen=$(echo "$wallpapers" | sed "s|$WALLPAPER_DIR/||" | rofi -dmenu -p "Wallpaper" -lines 10)

[ -z "$chosen" ] && exit 0

wallpaper_path="$WALLPAPER_DIR/$chosen"

[ ! -f "$wallpaper_path" ] && exit 1

hyprctl hyprpaper preload "$wallpaper_path"
hyprctl hyprpaper wallpaper ",$wallpaper_path"
hyprctl hyprpaper unload unused

mkdir -p "$(dirname "$CONFIG_FILE")"
> "$CONFIG_FILE"

echo "preload = $wallpaper_path" >> "$CONFIG_FILE"
echo "wallpaper = ,$wallpaper_path" >> "$CONFIG_FILE"

exit 0
