function clear-trash --wraps='rm -r ~/.local/share/Trash/files/*' --description 'alias clear-trash=rm -r ~/.local/share/Trash/files/*'
  rm -rf ~/.local/share/Trash/files/* $argv;
end
