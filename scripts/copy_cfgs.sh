#!/usr/bin/bash

set -euo pipefail

echo "Copying configs, scripts and wallpapers"
cp -r ~/Repos/dots/.config/* ~/.config/
cp -r ~/Repos/dots/.local/share ~/.local/

# Rebuilding bat theme cache
bat cache --build
