function sudoedit --wraps='doas nvim' --description 'alias sudoedit=doas nvim'
  doas nvim $argv; 
end
