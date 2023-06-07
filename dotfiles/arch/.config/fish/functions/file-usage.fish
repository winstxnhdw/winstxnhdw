function file-usage --wraps='ncdu -x --exclude Win10/' --wraps='ncdu -x / --exclude Win10/' --description 'alias file-usage=ncdu -x / --exclude Win10/'
  switch $argv[1]
    case '-v' '--verbose'
      ncdu -x / --exclude Win10/ $argv[2..-1]

    case '*'
      df -h /
  end
end
