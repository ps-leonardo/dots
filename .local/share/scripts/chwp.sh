#!/usr/bin/bash

magick "$1" current.png

hyprctl hyprpaper unload all >/dev/null
hyprctl hyprpaper preload ~/.local/share/wallpapers/current.png
hyprctl hyprpaper wallpaper "DP-1,~/.local/share/wallpapers/current.png" >/dev/null
hyprctl hyprpaper wallpaper "DP-2,~/.local/share/wallpapers/current.png" >/dev/null
sleep 0.3
hyprctl hyprpaper unload all >/dev/null
