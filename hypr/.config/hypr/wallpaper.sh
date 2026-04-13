#!/usr/bin/env bash

WALLPAPER_DIR="$HOME/wallpapers"
CURRENT="$WALLPAPER_DIR/.current"
touch "$CURRENT"

CURRENT_WALLPAPER=$(cat "$CURRENT")
FOCUSED_MONITOR=$(hyprctl monitors -j | jq -r ".[] | select(.focused) | .name")
WALLPAPER=$(find "$WALLPAPER_DIR/" -type f ! -name "$CURRENT_WALLPAPER" ! -name ".current" | shuf -n 1)
echo "$(basename "$WALLPAPER")" >"$CURRENT"

until hyprctl hyprpaper wallpaper "$FOCUSED_MONITOR,$WALLPAPER,"; do
	sleep 1
done
