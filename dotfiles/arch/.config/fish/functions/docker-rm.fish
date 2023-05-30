function docker-rm --wraps='docker rm -fv (docker ps -aq)' --description 'alias docker-rm=docker rm -fv (docker ps -aq)'
  docker rm -fv (docker ps -aq) $argv

end
