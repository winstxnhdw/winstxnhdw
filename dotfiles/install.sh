read -p "You are about to overwrite your configuration files. Are you sure? [y/N] " -n 1 -r
echo

if [[ $REPLY =~ ^[Nn]$ ]]
then
    echo "Aborting.."
    exit 1
fi

echo "Launching as root.."
sudo -s

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
ln -sf $origin_path/../grub/grub $grub_path

username=winston
cron_path=/var/spool/cron/$username

# Create symbolic link for cron
echo "Attempting to create a symbolic link for cron in $cron_path"
ln -sf $origin_path/../cron/$username $cron_path
