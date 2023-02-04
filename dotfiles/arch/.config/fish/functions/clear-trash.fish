function clear-trash --wraps='rm -r ~/.local/share/Trash/files/*' --description 'alias clear-trash=rm -r ~/.local/share/Trash/files/*'
  command rm -r ~/.local/share/Trash/files/* $argv;
end
