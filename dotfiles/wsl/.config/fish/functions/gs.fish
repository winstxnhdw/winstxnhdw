function gs --wraps='git stash' --description 'alias gs=git stash'
  git stash $argv
end
