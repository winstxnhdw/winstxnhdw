#!/bin/bash

PTH="/home/$USER/projects/winstxnhdw/dotfiles/Ubuntu"

cp /home/$USER/{.fehbg,.xinitrc,.xprofile,.Xresources,picom.conf} $PTH

cp -r /home/$USER/.config/{vis,polybar} $PTH
cp /home/$USER/.config/i3/config $PTH

code $PTH/.. 

echo "All dotfiles have been saved. Do not push to the repository if this was a mistake."