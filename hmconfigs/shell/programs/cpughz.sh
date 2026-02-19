#!/bin/bash

if ["$1" == ""]; then
	echo "Error: GHz not provided."
	exit
fi

sudo cpupower frequency-set -u "$1" && sudo cpupower frequency-set -d "$1"
