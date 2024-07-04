complete -c github -l dev -d 'Open repository in web editor'

complete -c github -a "(gh repo list --limit 200 --json name -q '.[].name')"
