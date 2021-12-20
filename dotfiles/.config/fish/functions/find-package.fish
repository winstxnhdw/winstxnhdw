function find-package --wraps='sudo pacman -Ql' --description 'alias find-package=sudo pacman -Ql'
  sudo pacman -Ql $argv; 
end
