function repo --description='Goes to the repository of the current project'
  set -l origin_url (command git config --get remote.origin.url)

  if not test -n "$origin_url"
    echo "No remote origin found."
    return 1
  end

  set -f repo_url (echo $origin_url | sed -e 's/\.git$//')

  if string match -q '*@*' $repo_url
    set -f repo_url https://(string replace : / (string split @ $repo_url)[-1])
  end

  open $repo_url
end
