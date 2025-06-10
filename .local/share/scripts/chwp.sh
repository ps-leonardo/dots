#!/usr/bin/bash

WALLPAPERDIR=~/.local/share/wallpapers/
cd $WALLPAPERDIR

WALLPAPER="$(eza | wofi --dmenu --allow-images)"

if [[ -z $WALLPAPER ]]; then
  notify-send 'No wallpaper selected'
  exit
fi

#TODO figure out a way to notify if nothing was selected in this part
while [[ -d $WALLPAPER ]]; do
  WALLPAPER="$WALLPAPER/"
  WALLPAPERDIR="$WALLPAPERDIR$WALLPAPER"
  cd "$WALLPAPERDIR"
  WALLPAPER="$(eza | wofi --dmenu --allow-images)"
done

swww img "$WALLPAPERDIR$WALLPAPER" --transition-type center

magick "$WALLPAPERDIR$WALLPAPER" ~/.config/hypr/resources/current.jpg

wallust run -s "$WALLPAPERDIR$WALLPAPER" >/dev/null 2>&1

pidof waybar >/dev/null && killall waybar
waybar &
