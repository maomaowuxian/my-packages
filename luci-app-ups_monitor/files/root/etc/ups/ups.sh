#!/bin/sh

while  clear
IN=$(upsc wifizoo input.voltage)
#OUT=$(upsc wifizoo output.voltage)
#BATT=$(upsc wifizoo battery.voltage)
#LOAD=$(upsc wifizoo ups.load)
V1=100
V2=$(echo ${IN%.*})
#echo $V2
#echo "       "UPS SYSTEM
#echo ------------------------
#echo "|"load average $LOAD"%" "      |"
#echo "|"input voltage $IN "  |"
#echo "|"output voltage $OUT " |"
#echo "|"battery voltage $BATT "|"
#echo ------------------------
do
sleep 2
if [ $V2 -lt $V1 ]
then
poweroff
sleep 3
else 
echo ok
sleep 3
fi
done
