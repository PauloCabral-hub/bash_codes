#!/bin/bash
# example: xinput map-to-output 18 eDP-1

DEVICES=$( xinput | grep 'Wacom' | wc -l )
l=1
while [ $l -le $DEVICES ]
do
	TOEVAL1="xinput | grep 'Wacom' | sed -n ${l}p | cut -f 2 | cut -d'=' -f2"
	TOEVAL2=$( eval $TOEVAL1 )
	TOEVAL3="xinput map-to-output ${TOEVAL2} eDP-1"
	eval $TOEVAL3
	l=`expr $l + 1`
done
