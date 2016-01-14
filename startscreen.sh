#!/bin/bash

while [ true ]
do
	for i in {1..3}
	do
		echo “$(date +%T) scan.sh cycles" >> /tmp/project.log
		bash scan.sh
		bash killwifite.sh
		sleep 5s
	done
	for i in {1..2}
	do
		echo “$(date +%T) scanWPA.sh cycles" >> /tmp/project.log
		bash scanWPA.sh
		bash killwifite.sh
		sleep 5s
	done
if [ -f /root/cracked.csv ]
		then
			echo “file cracked.csv bestaat”
			sleep 10s
			bash connmaker.sh
			sleep 10s
			bash conncheck.sh
	fi
done
