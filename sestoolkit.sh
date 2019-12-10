#!/usr/bin/env sh

# Arguments handler
for arg in "$@"
do
    if [ "$arg" == "--help" ] || [ "$arg" == "-h" ]
    then
        echo -e "\e[32mSecurity Strike Toolkit Help\e[39m"
        echo -e "Usage: "
    fi
done

# Architecture Detect
arch=$(uname -m)

if [[ arch != "x86_64" ]];
then
    echo -e "Your architecture is not AMD64, some functions may not work properly"
fi

# OS detection
function detect_os {
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
        exit 2;
    fi
}

# Linux Distribution detection
function detect_distro {

}
