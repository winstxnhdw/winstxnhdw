function commit-temp --description 'commit all changes (usually for squashing)'
  git add .
  git commit -m "DO NOT PUSH. THIS IS A TEMPORARY COMMIT."
  git rebase --root -i || git reset --soft HEAD~1
end
