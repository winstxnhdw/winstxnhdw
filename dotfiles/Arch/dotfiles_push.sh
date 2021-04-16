#!/bin/bash

PTH="/home/$USER/projects/winstxnhdw/dotfiles/Arch"

cp /home/$USER/{.fehbg,.xinitrc,.xprofile,.Xresources,picom.conf,.bashrc,.vimrc} $PTH

cp -r /home/$USER/.config/{i3,vis,polybar} $PTH

code $PTH/.. 

echo "All dotfiles have been saved. Do not push to the repository if this was a mistake."