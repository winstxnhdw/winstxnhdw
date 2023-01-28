function rm --description 'alias rm=rm'
  switch $argv[1]
    case '-*f'
      command rm -rf $argv
      return

    case '-*r'
      command rm -r $argv
      return
  end

  for arg in $argv
    set -l remove (command rm $arg 2>&1)

    if test -z '$remove'
      continue
      
    else
      for line in $remove
        echo $line
      end

      switch $arg
        case '--*'
          continue
      end
    end
    
    switch $remove
      case '*Is a directory'
        echo 'Would you like to use rm -r instead? [y/N] '

        switch (read -t)
          case Y y
            echo 'Attempting to remove directory.'
            command rm -r $arg

          case '*'
            echo 'No directories will be removed.'
        end
    end
  end
end
