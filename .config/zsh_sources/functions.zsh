# Adds functionality to sudo to accept aliases and functions
# Answer by SebMa from https://unix.stackexchange.com/questions/269078/executing-a-bash-script-function-with-sudo
function Sudo {
        local firstArg=$1
        if [ $(type -t $firstArg) = function ]
        then
                shift && command sudo bash -c "$(declare -f $firstArg);$firstArg $*"
        elif [ $(type -t $firstArg) = alias ]
        then
                alias sudo='\sudo '
                eval "sudo $@"
        else
                command sudo "$@"
        fi
}

# reboot command
function reboot {
	/bin/reboot --no-wall
}

# Mount USB
function mUSB {
	sudo mount /dev/sda1 /mnt/usb-drive
}

# Unmount USB
function umUSB {
	sudo umount /mnt/usb-drive
}

# Eject USB
function ejectUSB {
	sudo eject /dev/sda1 
}

# Connect to my provided lab machine from CUCyber
function cyberLabSSH {
	ssh user@10.3.100.110
}

# OverTheWire Connections
function bandit {
	ssh -p 2220 bandit"$1"@16.16.8.216
}

function leviathan {
	ssh -p 2223 leviathan"$1"@16.16.148.221
}

function century {
	ssh -p 22 century"$1"@century.underthewire.tech
}
