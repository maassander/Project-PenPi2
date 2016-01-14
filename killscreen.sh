#!/bin/bash

pid=$(ps aux | grep –i ‘[s]tartscreen.sh’ | awk ‘{ print $2 }’)
kill $pid
bash killwifite.sh
echo “Startscreen afgesloten”
