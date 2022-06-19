function first-push --description 'First push from a local repository to a git repository'
  git init
  git add .
  git commit -m "First Commit"
  git remote add origin $argv
  git push -u origin master
end
