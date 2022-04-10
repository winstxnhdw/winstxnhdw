function restore-er --description 'Copies the current Elden Ring userdata to a different directory and unzips a previous backup'
    cd /mnt/c/Users
    set -l username (string trim (cmd.exe /c echo %USERNAME%))
    set -l path /mnt/c/Users/$username/AppData/Roaming/EldenRing
    cd $path

    if test -f backup.zip
        mv (ls $path | grep -Po "\\d+") temp
        unzip backup
    else
        echo "No backup found. Aborting."
    end
end
