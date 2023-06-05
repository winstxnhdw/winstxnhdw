function wget --wraps='curl -O' --description 'alias wget=curl -O'
  curl -LO $argv
end
