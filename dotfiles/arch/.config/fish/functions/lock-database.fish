function lock-database --wraps='sudo rm /var/lib/pacman/db.lck' --description 'alias lock-database=sudo rm /var/lib/pacman/db.lck'
  sudo rm /var/lib/pacman/db.lck $argv; 
end
