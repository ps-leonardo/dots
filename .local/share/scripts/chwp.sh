#!/usr/bin/bash

wallpapersDir=~/.local/share/wallpapers/

magick "$1" "$wallpapersDir""current.jpg"

wallust run -s "$wallpapersDir""current.jpg" >/dev/null 2>&1

pidof waybar >/dev/null && killall waybar
waybar &

hyprctl hyprpaper unload all >/dev/null
hyprctl hyprpaper preload ~/.local/share/wallpapers/current.jpg >/dev/null
hyprctl hyprpaper wallpaper "DP-1,~/.local/share/wallpapers/current.jpg" >/dev/null
hyprctl hyprpaper wallpaper "DP-2,~/.local/share/wallpapers/current.jpg" >/dev/null
sleep 0.3
hyprctl hyprpaper unload all >/dev/null
