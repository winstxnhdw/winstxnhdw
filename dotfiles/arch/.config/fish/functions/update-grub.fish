function update-grub --wraps='grub-mkconfig -o /boot/grub/grub.cfg' --description 'alias update-grub=sudo grub-mkconfig -o /boot/grub/grub.cfg'
  sudo grub-mkconfig -o /boot/grub/grub.cfg
end
