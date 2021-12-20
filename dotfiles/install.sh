read -p "You are about to overwrite your configuration files. Are you sure? [y/N] " -n 1 -r
echo

if [[ $REPLY =~ ^[Nn]$ ]]
then
    echo "Aborting.."
    exit 1
fi

config_dirs=`ls .config`
origin_path=~/projects/winstxnhdw/dotfiles/.config
target_path=~/.config

for directory in $config_dirs
do
    # Create symbolic link
    echo "Attempting to create a symbolic link for $directory in $target_path/$directory"
    ln -sf $origin_path/$directory $target_path
done

grub_path=/etc/default/grub

# Create symbolic link for GRUB
echo "Attempting to create a symbolic link for GRUB in $grub_path"
sudo ln -sf $origin_path/../grub $grub_path
