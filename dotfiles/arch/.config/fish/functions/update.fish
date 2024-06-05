function update --wraps='yay -Syu' --description 'alias update=yay -Syu'
    if not test -z (pacman -Qu archlinux-keyring)
        sudo pacman -Sy archlinux-keyring --noconfirm
    end

    yay -Syu $argv &&
    sudo paccache -rk1 &&
    sudo pacman -Rnsc $(pacman -Qdtq)
end
