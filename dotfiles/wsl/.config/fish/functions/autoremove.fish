function autoremove --wraps='sudo pacman -Rnsc (pacman -Qdtq)' --description 'alias autoremove=sudo pacman -Rnsc (pacman -Qdtq)'
  sudo pacman -Rnsc (pacman -Qdtq)
end
