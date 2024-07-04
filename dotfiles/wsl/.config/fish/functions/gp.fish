function gp --wraps='git add -p' --description 'alias gp=git add -p'
  git add -p $argv
end
