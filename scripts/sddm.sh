#!/usr/bin/bash

sudo tar -xzvf ~/Repos/dots/optionals/sddm/frieren.tar.gz -C /usr/share/sddm/themes

sudo cp ~/Repos/dots/optionals/sddm/Xsetup /usr/share/sddm/scripts/Xsetup
sudo cp ~/Repos/dots/optionals/sddm/sddm.conf /etc/sddm.conf
