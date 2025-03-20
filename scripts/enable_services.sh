#!/usr/bin/bash

set -euo pipefail

# Copy Reflector config
sudo cp ~/Repos/dots/optionals/reflector/reflector.conf /etc/xdg/reflector/reflector.conf

# Enable systemd services
sudo systemctl enable bluetooth
sudo systemctl enable sddm
sudo systemctl enable reflector
