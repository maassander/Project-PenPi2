#!/bin/bash

lines=$(ls -l /etc/NetworkManager/system-connections/ | wc -l)
clines=$(( $lines - 1 ))
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
			ssid=$(iwgetid -r)
			echo “$(date +%T) geen internetverbinding met $ssid” >> /tmp/startscreen.l
			loc=$(find /etc/NetworkManager/system-connections/ -name $ssid)
			rm $loc
			echo “$(date +%T) $loc verwijderd” >> /tmp/startscreen.log
			ifconfig wlan0 down
			sleep 5s
			service network-manager restart
			sleep 5s
			ifconfig wlan0 up
			sleep 5s
		fi
	fi
done

