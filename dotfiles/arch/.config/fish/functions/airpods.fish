function airpods --wraps='bluetoothctl connect 40:E6:4B:34:CE:0B' --description 'alias airpods=bluetoothctl connect 40:E6:4B:34:CE:0B'
  bluetoothctl connect 40:E6:4B:34:CE:0B $argv; 
end
