function docker-clean --wraps='docker system prune -a -f' --description 'alias docker-clean=docker system prune -a -f'
  docker system prune -af
end
