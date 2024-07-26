#!/usr/bin/bash

set -euo pipefail

#Enable systemd services
echo "Initializing system services"
sudo systemctl enable bluetooth
sudo systemctl enable sddm
