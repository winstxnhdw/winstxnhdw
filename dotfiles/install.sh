read -p "You are about to overwrite your configuration files. Are you sure? [y/N] " -n 1 -r
echo

if [[ $REPLY =~ ^[Nn]$ ]]
then
    echo "Aborting.."
    exit 1
fi

origin_path=~/projects/winstxnhdw/dotfiles/.config
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

# Create symbolic link for GRUB
grub_path=/etc/default/grub
echo "Attempting to create a symbolic link for GRUB in $grub_path"
sudo ln -sf $origin_path/../grub/grub $grub_path

# Create symbolic link for cron
cron_path=$origin_path/../cron/cron
echo "Attempting to set $cron_path as crontab"
crontab $cron_path
