function get-networks --description 'Scan for new networks'
  while true
    clear
    iwctl station wlan0 scan > /dev/null
    iwctl station wlan0 get-networks
    sleep 3
  end
end
