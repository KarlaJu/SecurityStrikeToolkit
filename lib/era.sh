#!/bin/sh

# Era Library for common functions used across
# modules.

check_dep() {
	command -v "$1" > /dev/null 2>&1
	if [ "$?" ]; then
	echo "[✔]::[$1]: installation found!";
	else

	echo "[x]::[warning]:this module requires $1" ;
	echo ""
	echosleep 2
	echo ""
fi
	sleep 1
}

check_root() {
	[ "$(id -u)" -eq 0 ] && return "$TRUE" ||\
		echo "This module option must be run as root"; exit 1
}

# 2020 - SecStrikeToolkit
