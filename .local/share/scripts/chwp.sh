#!/usr/bin/bash

set -euo pipefail

WALLPAPERDIR=~/.local/share/wallpapers/
cd $WALLPAPERDIR

WALLPAPER="$(eza | fuzzel --dmenu)"

if [[ -z $WALLPAPER ]]; then
  notify-send 'No wallpaper selected'
  exit
fi

#TODO figure out a way to notify if nothing was selected in this part
while [[ -d $WALLPAPER ]]; do
  WALLPAPER="$WALLPAPER/"
  WALLPAPERDIR="$WALLPAPERDIR$WALLPAPER"
  cd "$WALLPAPERDIR"
  WALLPAPER="$(eza | fuzzel --dmenu)"
done

wallust run -s "$WALLPAPERDIR$WALLPAPER" >/dev/null 2>&1

pidof waybar >/dev/null && killall waybar
waybar &

swww img "$WALLPAPERDIR$WALLPAPER" --transition-type center

magick "$WALLPAPERDIR$WALLPAPER" ~/.config/hypr/resources/current.jpg
