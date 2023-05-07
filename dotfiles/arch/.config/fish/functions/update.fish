function update --wraps='yay -Syu' --description 'alias update=yay -Syu'
  sudo pacman -Sy archlinux-keyring --noconfirm
  yay -Syu $argv
  sudo paccache -rk1
  sudo pacman -Rnsc (pacman -Qdtq)
end
