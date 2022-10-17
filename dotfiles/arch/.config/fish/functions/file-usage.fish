function file-usage --wraps='ncdu -x --exclude Win10/' --wraps='ncdu -x / --exclude Win10/' --description 'alias file-usage=ncdu -x / --exclude Win10/'
  ncdu -x / --exclude Win10/ $argv; 
end
