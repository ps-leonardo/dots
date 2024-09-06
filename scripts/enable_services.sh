#!/usr/bin/bash

set -euo pipefail

#Enable systemd services
sudo systemctl enable bluetooth
sudo systemctl enable sddm
