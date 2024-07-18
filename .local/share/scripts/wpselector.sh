#!/usr/bin/bash

SCRIPTSDIR=~/.local/share/scripts/
WALLPAPERDIR=~/.local/share/wallpapers/

cd $WALLPAPERDIR
~/.local/share/scripts/chwp.sh "$WALLPAPERDIR/$(eza | fuzzel --dmenu)"
