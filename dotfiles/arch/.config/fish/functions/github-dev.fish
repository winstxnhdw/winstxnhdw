function github-dev --description='Goes to the development repository of the specified project'
  set -l github_url "https://github.dev"

  switch $argv[1]
    case '-u'
      open $github_url/$argv

    case '*'
      open $github_url/winstxnhdw/$argv
  end
end
