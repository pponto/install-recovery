#!/bin/bash
# ******************************************
# Program: Fresh Install Script
# Developer: @pponto
# Version: 0.1.1
# Date: 23-02-2018
# Last Updated: 12-03-2018
# ********************************************
# A script made to install all the packages and softwares, frequently required after a clean install of OS.

## Checking OS
if [ -f /etc/os-release ]; then
    # freedesktop.org and systemd
    . /etc/os-release
    OS=$NAME
    VER=$VERSION_ID
elif type lsb_release >/dev/null 2>&1; then
    # linuxbase.org
    OS=$(lsb_release -si)
    VER=$(lsb_release -sr)
elif [ -f /etc/lsb-release ]; then
    # For some versions of Debian/Ubuntu without lsb_release command
    . /etc/lsb-release
    OS=$DISTRIB_ID
    VER=$DISTRIB_RELEASE
else [ -f /etc/debian_version ];
    # Older Debian/Ubuntu/etc.
    OS=Debian
    VER=$(cat /etc/debian_version)
fi

## System Install
if [ $OS == "Fedora" ] || [ $OS == "CentOS" ] || [ $OS == "RedHat" ]
then
    echo "RPM System" $'\n'
    ./rpm.sh
elif [ $OS == "Ubuntu" ] || [ $OS == "Debian" ] || [ $OS == "Mint" ]
then
    echo "APT System" $'\n'
    # Do that
else
    echo "Unsupported Operating System";
fi
