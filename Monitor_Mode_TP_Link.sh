#!/bin/sh
airmon-ng check kill
ip link set wlan0 down
iw dev wlan0 set type monitor
