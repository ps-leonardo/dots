#!/usr/bin/bash

WALLPAPERDIR=~/.local/share/wallpapers/

cd $WALLPAPERDIR
WALLPAPER="$(eza | fuzzel --dmenu)"

if [[ -z $WALLPAPER ]]; then
  notify-send 'No wallpaper selected'
  exit
fi

wallust run -s "$WALLPAPERDIR$WALLPAPER" >/dev/null 2>&1

pidof waybar >/dev/null && killall waybar
waybar &

swww img "$WALLPAPERDIR$WALLPAPER" --transition-type center
