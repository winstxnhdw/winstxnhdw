iwctl station wlan0 scan

while true
do
    clear
    iwctl station wlan0 get-networks
    sleep 2
done

