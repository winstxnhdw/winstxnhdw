function wget --wraps='curl -LO' --description 'alias wget=curl -LO'
  curl -LO $argv
end
