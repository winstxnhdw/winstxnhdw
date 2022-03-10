function rm --description 'alias rm=rm'
  for arg in $argv
    set -l remove (command rm $arg 2>&1)

    if test -z "$remove"
      return
      
    else
      for line in $remove
        echo $line
      end

      switch $arg
        case '--*'
          return
      end
    end
    
    switch $remove
      case '*Is a directory'
        echo 'Would you like to use rm -r instead? [y/N] '
        switch (read -t)
          case Y y
            echo "Attempting to remove directory."
            command rm -r $arg
          case '' N n
            echo "No directories will be removed."
        end
    end
  end
end
