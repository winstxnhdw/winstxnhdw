function edit-grub --wraps='sudoedit /etc/default/grub' --description 'alias edit-grub=sudoedit /etc/default/grub'
  sudoedit /etc/default/grub $argv; 
end
