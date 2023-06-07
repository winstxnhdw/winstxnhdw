function alias-check --description "Print/edit fish alias"
  set -l alias_file $HOME/.config/fish/functions/$argv[1].fish

  switch $argv[2]
    case '--edit' '-e'
      vim $alias_file

    case '*'
      cat $alias_file
  end
end
