function repo --description='Goes to the repository of the current project'
  set -l origin_url (git config --get remote.origin.url)
  if test -n "$origin_url"
    set -l origin_url_without_git (echo $origin_url | sed -e 's/\.git$//')

    switch $origin_url_without_git
      case '*@*'
        open https://(string replace : / (string split @ $origin_url_without_git)[-1])
        return
    end

    open $origin_url_without_git

  else
    echo "No remote origin found."
  end
end
