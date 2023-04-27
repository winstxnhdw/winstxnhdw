function kill-port --wraps='fuser $argv[1]/tcp -k' --description 'alias kill-port=fuser $argv[1]/tcp -k'
  fuser $argv[1]/tcp -k
end
