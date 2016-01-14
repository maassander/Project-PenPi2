#!/bin/bash

echo “WEP scan gestart (screen –rx)”
screen –L –D –m wifite --mac --power 25 --wep -–nofakeauth -–wepsave /root/WEPcaps/
