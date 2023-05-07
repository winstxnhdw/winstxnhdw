function docker-rm --wraps='docker rm -flv (docker ps -aq)' --wraps='docker rm -fv (docker ps -aq)' --description 'alias docker-rm=docker rm -fv (docker ps -aq)'
  docker rm -fv (docker ps -aq) $argv
        
end
