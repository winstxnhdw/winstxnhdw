function clone --description 'Switch to the git directory after cloning'
  switch $argv
    case '*.git'
      git clone --recursive $argv
      cd (string split . (basename $argv))[1]

    case '*'
      git clone --recursive git@github.com:winstxnhdw/$argv.git
      cd $argv
  end
end
