#!/bin/bash
DATA_FILE="/home/duncan/.scripts/data_files/bt-devices"

getEntry () {
	if [[ $# -ne 1 ]]
	then
		exit
	fi
	val=$(grep "^$1," ${DATA_FILE})
	echo $val
}

getMac () {
	val=$(echo $1 | awk -F ',' '{ print $2 }')
	#val $(grep -oe "\([A-F0-9]\{2\}:\)\{5\}\([A-F0-9]\{2\}\)") ${DATA_FILE}
	echo $val
}
