function uninstall --wraps='sudo pacman -Rnsc' --description 'alias uninstall=sudo pacman -Rnsc'
  sudo pacman -Rnsc $argv
end
