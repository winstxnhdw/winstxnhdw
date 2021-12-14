read -p "You are about to overwrite your configuration files. Are you sure? [y/N] " -n 1 -r
echo

if [[ $REPLY =~ ^[Nn]$ ]]
then
    echo "Aborting.."
    exit 1
fi

config_dirs=`ls .config`
target_path=~/.config

for directory in $config_dirs
do
    # Remove the directory
    rm -rf $target_path/$directory

    # Create symbolic link
    echo "Attempting to create a symbolic link for $directory in $target_path/$directory"
    ln -s .config/$directory ~/.config
done

# Create symbolic link for .xinitrc
echo "Attempting to create a symbolic link for .xinitrc in $HOME"
ln -sf .xinitrc ~/.xinitrc