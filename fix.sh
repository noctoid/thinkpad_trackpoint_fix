#!/bin/sh

DEVICE_ID=`xinput list | grep TrackPoint | awk '{print $6}' | sed -r  's/^[^0-9]*([0-9]+).*/\1/'`
# echo $DEVICE_ID
PROP_ID=`xinput list-props $DEVICE_ID | grep "Accel Speed (" | awk '{print $4}' | sed -r 's/^[^0-9]*([0-9]+).*/\1/'`
# echo $PROP_ID
xinput set-prop $DEVICE_ID $PROP_ID -0.3


if [ $? -eq 0 ];
then
	echo "Successfully fixed trackpoint acceleration!"
else
       echo "Operation Failed with error code - $?"
fi       
