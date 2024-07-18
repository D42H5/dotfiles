#!/bin/bash

file="$XDG_CONFIG_HOME/hypr/monitor_rules.conf"
monitor="eDP-1"

line=`tail -n 1 "$file" | tee >(wc -c | xargs -I {} truncate "$file" -s -{})`
echo $line | grep "mirror" > /dev/null

# Swap default monitor rule of mirrored display or no mirrored display
if [[ $? == 0 ]]; then
	echo $line | sed "s/,mirror.*//" >> $file
	echo "Default monitor rule = no mirrored displays"
else
	echo $line | sed "s/$/,mirror,$monitor/" >> $file
	echo "Default monitor rule = mirrored displays"
fi
