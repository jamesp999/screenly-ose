#!/bin/bash -e

# monitor-onoff
# Script to enable and disable the HDMI signal of the Raspberry PI

CMD="$1"

function on {
	sudo vcgencmd display_power 1
    # Hack to enable virtual terminal nr 7 again:
    #chvt 6
    #chvt 7
}

function off {
	sudo vcgencmd display_power 0
}

function main {
    if [ "$CMD" == "on" ]; then
        on
    elif [ "$CMD" == "off" ]; then
        off
    else
        echo "Usage: $0 <on|off>"
        exit 1
    fi
    exit 0
}

main
