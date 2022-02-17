function rm --description 'alias rm=rm'
  set -l remove (command rm $argv 2>&1)

  if test -z $remove
    return
  else
    echo $remove
  end
  
  switch $remove
    case '*Is a directory'
      echo 'Would you like to use rm -r instead? [y/N] '
      switch (read -t)
        case Y y
          echo "Attempting to remove directory."
          command rm -r $argv
        case '' N n
          echo "No directories will be removed."
      end
  end
end
