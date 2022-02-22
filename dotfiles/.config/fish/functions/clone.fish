function clone --description 'Switch to the git directory after cloning'
  git clone $argv ; cd (string split . (basename $argv))[1]
end
