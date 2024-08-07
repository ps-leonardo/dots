#!/usr/bin/bash

set -euo pipefail

THEME=$1

if [[ $THEME == 'tokyo-night'  ]]; then
  $aurhlpr -S tokyonight-gtk-theme-git
elif [[ $THEME == 'catppuccin-mocha' ]]; then
  $aurhlpr -S catppuccin-gtk-theme-mocha
fi

cp -r ~/Repos/dots/themes/$THEME/* ~/.config/
cp -r ~/Repos/dots/.local/share ~/.local/

# Rebuilding bat theme cache
bat cache --build
