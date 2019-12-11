#!/usr/bin/env sh

DEBIAN_SH_PATH='distros/debian.sh'

# Arguments handler
for arg in "$@"
do
    if [ "$arg" = "--help" ] || [ "$arg" = "-h" ]
    then
        echo -e "\e[32mSecurity Strike Toolkit Help\e[39m"
        echo -e "Usage:  sestoolkit.sh <FLAGS> <OPTIONS>"
    fi
done

# OS detection
detect_os() {
    if [[ "$OSTYPE" == "linux-gnu" ]];
    then
        kernel_version
    elif [[ "$OSTYPE" == "darwin"* ]];
    then
        echo -e "\e[31mNot yet supported\e[39m"
    elif [[ "$OSTYPE" == "cygwin" ]];
    then
        echo -e "\e[31mNot yet supported\e[39m"
    elif [[ "$OSTYPE" == "msys" ]];
    then
        echo -e "\e[31mNot yet supported\e[39m"
    elif [[ "$OSTYPE" == "win32" ]];
    then
        echo -e "\e[31mDefinitely not supported\e[39m"
    elif [[ "$OSTYPE" == "freebsd"* ]];
    then
        echo -e "\e[33mNo plans for support[39m"
    else
        exit 2
    fi
}

# Linux Distribution detection
detect_distro() {
    if [  -n "$(gcc -version | grep Ubuntu)" ]; then
        echo -e "You are running Ubuntu"
    elif [ -n "$(gcc -version | grep Debian)" ]; then
        echo -e "You are running Debian"
        "$DEBIAN_SH_PATH"
    elif [ -n "$(gcc -version | grep Manjaro)" ]; then
        echo -e "You are running Manjaro"
    fi
}

# Find Kernel Version
kernel_version() {
    kernel=$(awk -F. '{print $1$2}' <<< $(uname -r))

    if [ $kernel -lt 30 ]; then
        echo -e "This script doesn't support any kernel version prior to 3.0.0"
    fi

    echo -e "Kernel version is [OK], proceeding to detect distribution"
    detect_distro
}
