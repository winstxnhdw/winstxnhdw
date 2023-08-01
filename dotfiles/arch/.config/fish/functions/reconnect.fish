function reconnect --description 'Attempts to reconnect to the network'
  iwctl station wlan0 disconnect $argv[1]
  iwctl station wlan0 connect $argv[1]
end
