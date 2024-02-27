function update --wraps='yay -Syu' --description 'alias update=yay -Syu'
  sudo sh -c '
    pacman -Sy archlinux-keyring --noconfirm &&
    yay -Syu $argv &&
    paccache -rk1 &&
    pacman -Rnsc $(pacman -Qdtq)
  '
end
