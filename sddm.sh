#!/usr/bin/bash

sudo tar -xzvf ~/Repos/dots/sddm/sugar-candy.tar.gz -C /usr/share/sddm/themes

sudo cp ~/Repos/dots/sddm/Xsetup /usr/share/sddm/scripts/Xsetup
sudo cp ~/Repos/dots/sddm/sddm.conf /etc/sddm.conf

sudo cp ~/Repos/dots/sddm/Backgrounds/* /usr/share/sddm/themes/sugar-candy/Backgrounds/
