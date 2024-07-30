#!/bin/bash

set -euo pipefail

cd $HOME/Repos/

if [ ! -d $HOME/Repos/yay ]; then
  git clone https://aur.archlinux.org/yay.git
fi

cd yay
makepkg -si
