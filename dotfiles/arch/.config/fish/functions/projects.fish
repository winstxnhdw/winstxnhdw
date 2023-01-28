function projects --wraps='cd ~/projects/' --description 'alias projects=cd ~/projects/'
  if test -z $argv[1]
    cd ~/projects
  else
    cd ~/projects/$argv; 
  end
end
