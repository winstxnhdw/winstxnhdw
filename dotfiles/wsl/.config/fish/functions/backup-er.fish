function backup-er --description 'Zips Elden Ring userdata'
    cd /mnt/c/Users
    set -l username (string trim (cmd.exe /c echo %USERNAME%))
    set -l path /mnt/c/Users/$username/AppData/Roaming/EldenRing
    cd $path
    
    zip -r backup (ls $path | grep -Po "\\d+")
end
