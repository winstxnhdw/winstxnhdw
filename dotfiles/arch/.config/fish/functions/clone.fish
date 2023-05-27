function clone --description 'Switch to the git directory after cloning'
  switch $argv
    case '*.git'
      git clone --recursive $argv
      pushd (string split . (basename $argv))[1]

    case '*'
      git clone --recursive git@github.com:winstxnhdw/$argv.git
      pushd $argv
  end
end
