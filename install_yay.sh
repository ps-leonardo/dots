#!/bin/bash

set -euo pipefail
mkdir Repos
cd Repos
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
