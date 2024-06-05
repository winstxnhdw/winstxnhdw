function squash --description 'rebase the latest commit (usually for squashing)'
  if test -z $argv
    git commit --amend
  else
    git commit --amend -m "$argv"
  end
end
