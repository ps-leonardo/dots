#!/usr/bin/bash

SCRIPTSDIR=~/.local/share/scripts/
WALLPAPERDIR=~/.local/share/wallpapers/

cd $WALLPAPERDIR
WALLPAPER="$(eza | fuzzel --dmenu)"

echo $WALLPAPER

if [[ -z $WALLPAPER ]]; then
  notify-send 'No wallpaper selected'
  exit
fi

~/.local/share/scripts/chwp.sh $WALLPAPER
