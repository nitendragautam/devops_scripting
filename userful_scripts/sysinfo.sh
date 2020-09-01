#!/bin/bash

#This Script displays information about the system on which it is executed .


echo "Starting the sysinfo Script"

SYSTEM_HOST_NAME=$(hostname -f)
echo "hostname of the system: $SYSTEM_HOST_NAME"

#Display the current date and time when this information was collected.
TODAYS_DATE=$(date)
echo "Todays Date: $TODAYS_DATE"

echo "Kernel release  followed by architecture"
echo ""
uname -mrn

echo "Displaying the disk usage in  a human  readable format"
echo ""
df -h


echo "Display Top 5 process using high memory Sorted "
echo ""
  ps -er -o pid=Process,pcpu=CPU,ruser=RealUser,comm=Command |head -5

echo ""
#End the Script by Letting the user know that it's done
echo "stopping ths sysinfo script"
