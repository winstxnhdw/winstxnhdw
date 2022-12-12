function wifi --wraps='iwctl station wlan0' --description 'alias wifi=iwctl station wlan0'
  iwctl station wlan0 $argv; 
end
