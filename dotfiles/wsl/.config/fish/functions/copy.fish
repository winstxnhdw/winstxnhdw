function copy --wraps='xsel -ib' --description 'alias copy=xsel -ib'
  xsel -ib $argv
end
