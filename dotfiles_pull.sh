#!/bin/bash

PTH="/home/$USER/projects/winstxnhdw/dotfiles"

cp $PTH/{.fehbg,.xinitrc,.xprofile,.Xresources,picom.conf} /home/$USER

cp -r $PTH/{i3,vis} /home/$USER/.config