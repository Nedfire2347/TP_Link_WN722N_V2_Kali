#!/bin/sh
if [ $# -eq 0 ]; then
	echo '\n\tUsage :\n \tstart : Starting Monitor Mode \n\tstop : Disabling Monitor Mode'
	echo '\tYou can precise your Interface : '
	echo "\t\tex : start wlan0"
elif [ $# -eq 2 ]; then
	var=$2
else
	var="wlan0"
fi

if [ "$1" = 'start' ]; then
	airmon-ng check kill
	ip link set $var down
	iw dev $var set type monitor
	service NetworkManager start

elif [ "$1" = 'stop' ]; then
	airmon-ng check kill
	ip link set $var down
	iw dev $var set type managed
	service NetworkManager restart

else
	echo '\n\tUsage :\n \tstart : Starting Monitor Mode \n\tstop : Disabling Monitor Mode'
	echo '\tYou can precise your Interface : '
	echo "\t\tex : start wlan0"
fi
