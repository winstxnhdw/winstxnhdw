function docker-stop --wraps='docker stop (docker ps -aq)' --description 'alias docker-stop=docker stop (docker ps -aq)'
  docker stop (docker ps -aq) $argv
        
end
