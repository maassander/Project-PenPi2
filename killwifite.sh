#!/bin/bash

iw dev wlan1 del
iw phy phy0 interface add wlan0 type managed
ifconfig wlan0 up
service network-manager start
