#!/bin/bash

Ip=$(hostname -I | awk ‘{ print $1 }’)
echo $ip > hostname.txt
Wile IFS=”.” Read a b c d
do
	nmap –sP $a.$b.$c.0/24 –oN nmapresults
done < hostname.txt
