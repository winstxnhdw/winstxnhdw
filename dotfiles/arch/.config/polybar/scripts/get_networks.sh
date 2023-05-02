while true
do
    clear
    iwctl station wlan0 scan > /dev/null
    iwctl station wlan0 get-networks
    sleep 3
done

