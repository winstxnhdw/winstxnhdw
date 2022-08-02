#!/bin/bash

read -p "You are about to overwrite your configuration files. Are you sure? [y/N] " -n 1 -r
echo

if [[ $REPLY =~ ^[Nn]$ ]]
then
    echo "Aborting.."
    exit 1
fi

origin_path=~/projects/winstxnhdw/dotfiles/wsl/.config
target_path=~/.config

for directory in `ls -p .config | grep / | sed 's@/@@g'`
do
    # Create symbolic link
    echo "Attempting to create a symbolic link for $directory in $target_path/$directory"
    rm -r $target_path/$directory
    ln -sf $origin_path/$directory $target_path
done

for file in `ls -p .config | grep -v /`
do
    # Create symbolic link
    echo "Attempting to create a symbolic link for $file in $target_path/$file"
    rm $target_path/$file
    ln -sf $origin_path/$file $target_path
done

# Create symbolic link for doas
doas_path=/etc/doas.conf
echo "Attempting to create a symbolic link for doas in $doas_path"
sudo ln -sf $origin_path/../doas/doas.conf $doas_path
sudo chown -c root:root /etc/doas.conf
