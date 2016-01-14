#!/bin/bash

lines=$(ls -l /etc/NetworkManager/system-connections/ | wc -l)
clines=$(( $lines - 1 ))
echo $clines
for i in {1..$clines}
do
	check=$(nmcli --terse --fields STATE dev status | grep connected)
	if [ “$check” == “connected” ];
	then
		wget –q --tries=10 --timeout=20 --spider http://www.google.be
		if [[ $? -eq0 ]];
			then
			bash /root/Documents/mailupdate.sh
			echo “$(date +%T) dropbox update verzonden >> /tmp/startscreen.log
		else
			ifconfig wlan0 down
			ssid=$(iwgetid -r)
			echo “$(date +%T) geen internetverbinding met $ssid” >> /tmp/startscreen..
			loc=$(find /etc/NetworkManager/system-connections/ -name ‘$ssid’)
			rm $loc
			echo “$(date +%T) $loc verwijderd” >> /tmp/startscreen.log
			service network-manager restart
			ifconfig wlan0 up
		fi
	fi
done
