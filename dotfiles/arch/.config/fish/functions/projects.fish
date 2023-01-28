function projects --wraps='cd ~/projects/' --description 'alias projects=cd ~/projects/'
  if test -z $argv
    cd ~/projects

  else
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

    cd $project
  end
end
