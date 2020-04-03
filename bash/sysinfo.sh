#!/bin/bash

#This Script displays information about the system on which it is executed .

#Tell the user script is Starting
echo "Starting the sysinfo Script"

#Display the hostname of the system
hostname -f
hostname

#Display the current date and time when this information was collected.
date

#Display the Kernel release  followed by architecture
uname -r
uname -m

#Display the disk usage in  a human  readable format
df -h

#End the Script by Letting the user know that it's done
echo "stopping ths sysinfo script"
