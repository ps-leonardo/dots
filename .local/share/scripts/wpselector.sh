#!/usr/bin/bash

SCRIPTSDIR=~/.local/share/scripts/
WALLPAPERDIR=~/.local/share/wallpapers/

cd $WALLPAPERDIR
~/.local/share/scripts/chwp.sh "$(yad --width 900 --height 600 --file --add-preview --large-preview --title="Choose Wallpaper")"
