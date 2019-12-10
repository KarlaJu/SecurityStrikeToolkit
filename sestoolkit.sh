#!/usr/bin/env sh

# Arguments handler
for arg in "$@"
do
    if [ "$arg" = "--help" ] || [ "$arg" = "-h" ]
    then
        echo -e "\e[32mSecurity Strike Toolkit Help\e[39m"
        echo -e "Usage: "
    fi
done

# Architecture Detect
arch=$(uname -m)

if [[ $arch != "x86_64" ]];
then
    echo -e "Your architecture is not AMD64, some functions may not work properly"
fi

# OS detection
detect_os() {
    if [[ "$OSTYPE" == "linux-gnu" ]];
    then
        detect_distro
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
        echo -e "\e[33mYou are using a BSD machine, script may or may not work. We haven't done testing\e[39m"
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
}
