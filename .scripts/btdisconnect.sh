#!/bin/bash
source $HOME/.scripts/bt-helper.sh

DEV_ENTRY="$(getEntry $1)"

if [[ ${DEV_ENTRY} != "" ]]
then
	MAC=$(getMac ${DEV_ENTRY})
	bluetoothctl disconnect ${MAC}
else
	echo "Device '$1' not found"
fi
