#!/bin/bash

lines=$(awk ‘END {print NR}’ cracked.csv)
for i in {1..$lines}
do
	while IFS=’,’ read a b c d e
	do
		mac=$a
		wifi=$b
		ssid=$c
		pass=$d
		bool=$e
		echo “SSID $ssid gevonden”
		if ! [ -f /etc/NetworkManager/system-connections/$ssid ]
		then
			nmcli dev wifi connect $ssid password $pass
			sleep 5s
			bash scannmap.sh
			scan=$(cat nmapresults)
			echo $scan >> nmaplist
		else
			echo “Verbinding bestaat al”
		fi
	done < cracked.csv
done
