function wget --wraps='curl -O' --description 'alias wget=curl -O'
  curl -O $argv; 
end
