#!/bin/bash
source /home/duncan/.scripts/bt-helper.sh

DEV_ENTRY="$(getEntry $1)"

if [[ ${DEV_ENTRY} != "" ]]
then
	MAC=$(getMac ${DEV_ENTRY})
	bluetoothctl connect ${MAC}
else
	echo "Device '$1' not found"
fi
