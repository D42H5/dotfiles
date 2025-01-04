#!/bin/bash

while true;
do
	LEVEL=`cat /sys/class/power_supply/BAT0/capacity`
	BAT_STATE="$(upower --dump | sed -n "/BAT0/,/^$/p" | grep "state" | awk '{print $2}')"

	if [ "$BAT_STATE" != "charging" -a "$LEVEL" -le "3" ]; 
	then
		i3-nagbar -m "Critical battery reached... shutting down in 10 seconds..." &
		sleep 10
		shutdown -h now
	fi
	sleep 60
done
