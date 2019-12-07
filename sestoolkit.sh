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

# OS detection
function detect_os {
    if [[ "$OSTYPE" == "linux-gnu" ]];
    then
        detect_distro
    elif [[ "$OSTYPE" == "darwin"* ]];
    then
        echo -e "Not yet supported"
    elif [[ "$OSTYPE" == "cygwin" ]];
    then
        echo -e "Not yet supported"
    elif [[ "$OSTYPE" == "msys" ]];
    then
        echo -e "Not yet supported"
    elif [[ "$OSTYPE" == "win32" ]];
    then
        echo -e "Definitely not supported"
    elif [[ "$OSTYPE" == "freebsd"* ]];
    then
        echo -e "You are using a BSD machine, script may or may not work. We haven't done testing"
    else
        exit 2;
    fi
}

# Linux Distribution detection
function detect_distro {

}
