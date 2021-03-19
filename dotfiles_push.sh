#!/bin/bash

PTH="/home/$USER/projects/winstxnhdw/dotfiles"

cp /home/$USER/{.fehbg,.xinitrc,.xprofile,.Xresources,picom.conf} $PTH

cp -r /home/$USER/.config/{i3,vis,polybar} $PTH

code $PTH/.. 

echo "All dotfiles have been saved. Do not push to the repository if this was a mistake."