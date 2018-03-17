#! /usr/bin/env bash

cmdname=${0##*/}

helpmsg() {
    echo "Brief:"
    echo "    check if [ipv6] address is valid"
    echo "Usage:"
    echo "    $cmdname [ipv6]"
    echo "Try again"
    echo ""
}

if [[ $# -lt 1 ]]; then
    helpmsg
    exit 1
fi

ipaddr=$1
result=0

if [[ $ipaddr =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
    OIFS=$IFS
    IFS='.'
    ipaddr=($ipaddr)
    IFS=$OIFS
    if [[ ${ipaddr[0]} -le 255 && ${ipaddr[1]} -le 255 && ${ipaddr[2]} -le 255 && ${ipaddr[3]} -le 255 ]]; then
        result=1
    else
        result=0
    fi
fi
echo "$result"
