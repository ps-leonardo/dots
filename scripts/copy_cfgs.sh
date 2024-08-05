#!/usr/bin/bash

set -euo pipefail

THEME=$1

cp -r ~/Repos/dots/themes/$THEME/* ~/.config/
cp -r ~/Repos/dots/.local/share ~/.local/

# Rebuilding bat theme cache
bat cache --build
