function gd --wraps='git diff --name-only --relative --diff-filter=d | xargs bat --diff --paging=never' --description 'alias gd=git diff --name-only --relative --diff-filter=d | xargs bat --diff'
  git diff --name-only --relative --diff-filter=d | xargs bat --diff --paging=never
end
