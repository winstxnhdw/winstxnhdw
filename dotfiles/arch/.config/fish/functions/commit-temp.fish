function commit-temp --description 'commit all changes (usually for squashing)'
  git add .
  git commit --fixup=HEAD
  git rebase -i HEAD~2 || git reset --soft HEAD~1
end
