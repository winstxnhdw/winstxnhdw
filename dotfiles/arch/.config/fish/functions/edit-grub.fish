function edit-grub --wraps='xdg-open (readlink -e /etc/default/grub)' --description 'alias edit-grub=xdg-open (readlink -e /etc/default/grub)'
  xdg-open (readlink -e /etc/default/grub)
end
