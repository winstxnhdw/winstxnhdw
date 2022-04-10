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
