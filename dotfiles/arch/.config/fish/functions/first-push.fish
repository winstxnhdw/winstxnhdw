function first-push --description 'First push from a local repository to a git repository'
  git init
  git add .
  git commit -m "chore: initialise repository"
  git remote add origin $argv
  git push -u origin master
end
