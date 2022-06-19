function aliases --description "List all fish aliases"
  for f in ~/projects/winstxnhdw/dotfiles/arch/.config/fish/functions/*
    echo (head -1 $f | cut -c10-)
  end
end