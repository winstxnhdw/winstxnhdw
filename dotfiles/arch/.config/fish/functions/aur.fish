function aur --wraps='pacman -Qm' --wraps='pacman -Qqm' --description 'alias aur=pacman -Qqm'
  pacman -Qqm
end
