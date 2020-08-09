#!/bin/bash
# We will read 2 arguments from the command Line                                          #
echo "Script Name " $0
echo "First Argument " $1
echo "First Argument " $2

echo "Printing All Arguments At Once "
echo "$*" 

NUM_ARGS=$#
echo "Total number of arguments passed to script" $NUM_ARGS
echo "Exit status id of the last command executed." $?