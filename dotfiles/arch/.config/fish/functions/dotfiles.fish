function dotfiles --description 'cd to the dotfiles directory'
  set -l dotfiles_path (readlink -f $HOME/.config/fish/..)
  cd $dotfiles_path
end
