function github --description='Goes to the repository of the specified project'
  set -l github_url "https://github.com"

  switch $argv[1]
    case '--dev'
      open https://github.dev/winstxnhdw/$argv[2]

    case '-u'
      open $github_url/$argv

    case '*'
      open $github_url/winstxnhdw/$argv
  end
end
