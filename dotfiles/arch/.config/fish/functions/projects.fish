function projects --wraps='pushd ~/projects/' --description 'alias projects=pushd ~/projects/'
  if test -z $argv
    pushd ~/projects
    return
  end

  set -l project ~/projects/$argv

  if not test -d $project
    echo "$project does not exist. Would you like to create it? [Y/n] "

    switch (read -t)
      case Y y
        mkdir $project

      case '*'
        echo "Aborting.."
        return
    end
  end

  pushd $project
end
