function er-backup --description 'Zips Elden Ring userdata'
    pushd /mnt/c/Users
    set -l username (string trim (cmd.exe /c echo %USERNAME%))
    set -l path /mnt/c/Users/$username/AppData/Roaming/EldenRing
    pushd $path

    zip -r backup (ls $path | grep -Po "\\d+")
end
