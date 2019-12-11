#!/usr/bin/env sh

cat <<-EOF
Please select your desired security / privacy level.

1- Minor
2- Medium
3- High

If in doubt please type "<mode> -h or <mode> --help" to show
mode

EOF
read option

case $option in
    1) echo -e "You chose the minor level"
       echo -e "Installing required packages..."
       ;;
