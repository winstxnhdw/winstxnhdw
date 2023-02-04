function unlock-database --wraps='sudo rm /var/lib/pacman/db.lck' --description 'alias unlock-database=sudo rm /var/lib/pacman/db.lck'
  sudo (command rm /var/lib/pacman/db.lck $argv)
end
