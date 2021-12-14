#!/bin/bash

# Variables
bar_name=main

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar > /dev/null
do 
    sleep 0.5
done

if type "xrandr"
then
    for m in $(xrandr --query | grep " connected" | cut -d" " -f1)
    do
        MONITOR=$m polybar --reload $bar_name &
    done
else
    polybar --reload $bar_name &
fi

echo "Bars launched..."
