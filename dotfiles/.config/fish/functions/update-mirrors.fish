function update-mirrors --wraps=sudo\ curl\ \'https://archlinux.org/mirrorlist/\?country=SG\&protocol=https\&ip_version=4\&use_mirror_status=on\'\ \|\ sudo\ tee\ cut\ -c2-\ \>\ /etc/pacman.d/mirrorlist --wraps=curl\ \'https://archlinux.org/mirrorlist/\?country=SG\&protocol=https\&ip_version=4\&use_mirror_status=on\'\ \|\ cut\ -c2-\ \|\ sudo\ tee\ /etc/pacman.d/mirrorlist --description alias\ update-mirrors=curl\ \'https://archlinux.org/mirrorlist/\?country=SG\&protocol=https\&ip_version=4\&use_mirror_status=on\'\ \|\ cut\ -c2-\ \|\ sudo\ tee\ /etc/pacman.d/mirrorlist
  curl 'https://archlinux.org/mirrorlist/?country=SG&protocol=https&ip_version=4&use_mirror_status=on' | cut -c2- | sudo tee /etc/pacman.d/mirrorlist $argv; 
end
