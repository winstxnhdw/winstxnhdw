#!/bin/bash

# check to see is git command line installed in this machine
IS_GIT_AVAILABLE="$(git --version)"
if [[ $IS_GIT_AVAILABLE == *"version"* ]]; then
  echo "Git is available"

else
  echo "Git is not installed"
  exit 1
fi

PTH="/home/$USER/projects/winstxnhdw/dotfiles"

cp /home/$USER/{.fehbg,.xinitrc,.xprofile,.Xresources,picom.conf} $PTH

cp -r /home/$USER/.config/{i3,vis} $PTH

code $PTH/.. 
