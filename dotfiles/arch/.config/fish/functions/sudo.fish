function sudo --wraps='su -c' --description 'alias sudo=su -c'
  su -l root -c "$argv"; 
end
