function autoremove --wraps='sudo pacman -Rnsc (pacman -Qdtq)' --description 'alias autoremove=sudo pacman -Rnsc (pacman -Qdtq)'
  sudo paccache -rk1
  sudo pacman -Rnsc (pacman -Qdtq)
end
