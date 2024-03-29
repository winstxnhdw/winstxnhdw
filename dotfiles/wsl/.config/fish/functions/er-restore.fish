function er-restore --description 'Copies the current Elden Ring userdata to a different directory and unzips a previous backup'
    pushd /mnt/c/Users
    set -l username (string trim (cmd.exe /c echo %USERNAME%))
    set -l path /mnt/c/Users/$username/AppData/Roaming/EldenRing
    pushd $path

    if test -f backup.zip
        mv --backup=t (ls $path | grep -Po "\\d+") temp
        unzip backup
    else
        echo "No backup found. Aborting."
    end
end
