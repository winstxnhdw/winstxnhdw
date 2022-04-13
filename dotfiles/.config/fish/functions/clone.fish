function clone --description 'Switch to the git directory after cloning'
  switch $argv
    case '*.git'
        git clone $argv
        cd (string split . (basename $argv))[1]

    case '*'
        git clone git@github.com:winstxnhdw/$argv.git
    end
end
