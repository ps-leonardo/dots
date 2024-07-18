#!/usr/bin/bash

set -euo pipefail

#./install_yay.sh

sudo pacman -S --needed - <packages.lst
yay -S --needed - <aur.lst
