read -p "You are about to overwrite your configuration files. Are you sure? [y/N] " -n 1 -r
echo

if [[ $REPLY =~ ^[Nn]$ ]]
then
    echo "Aborting.."
    exit 1
fi

config_dirs=`ls -p .config | grep / | sed 's@/@@g'`
origin_path=~/projects/winstxnhdw/dotfiles/.config
target_path=~/.config

for directory in $config_dirs
do
    # Create symbolic link
    echo "Attempting to create a symbolic link for $directory in $target_path/$directory"
    rm -r $target_path/$directory
    ln -sf $origin_path/$directory $target_path
done

config_files=`ls -p .config | grep -v /`

for file in $config_files
do
    # Create symbolic link
    echo "Attempting to create a symbolic link for $file in $target_path/$file"
    rm $target_path/$file
    ln -sf $origin_path/$file $target_path
done

grub_path=/etc/default/grub

# Create symbolic link for GRUB
echo "Attempting to create a symbolic link for GRUB in $grub_path"
sudo ln -sf $origin_path/../grub/grub $grub_path

cron_path=$origin_path/../cron/cron

echo "Attempting to set $cron_path as crontab"
crontab $cron_path
