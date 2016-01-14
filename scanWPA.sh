#!/bin/bash

Echo “WPA scan gestart (screen –rx)”
screen –L –D –m wifite –-mac -–power 25 –-wpa -–aircrack --crack --dict /root/Downloads/rockyou.txt
