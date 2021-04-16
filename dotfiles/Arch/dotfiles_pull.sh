#!/bin/bash

read -p "Are you sure you want to overwrite your dotfiles (y/n)? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    PTH="/home/$USER/projects/winstxnhdw/dotfiles/Arch"

    cp $PTH/{.fehbg,.xinitrc,.xprofile,.Xresources,picom.conf,.bashrc,.vimrc} /home/$USER

    cp -r $PTH/{i3,vis,polybar} /home/$USER/.config

    echo "All dotfiles have been restored."
fi