#!/bin/bash

#================================================
#  Example: ./bashArguments.sh args1 args2 .. ..   
# In this Example we will read the arguments from the command Line                                          #
#=================================================

# Number of Arguments Passed to the Bash Script
NUM_ARGS=$#

echo " Number of Arguments Passed: $NUM_ARGS"

if [[ "$NUM_ARGS" -ge 1 ]];then

#We can also store arguments from the bash command line in special array
args=("$@")

    for (( i = 0; i < $NUM_ARGS; i++ ))
    do
        echo "Argument $i: " ${args[i]}
    done

# Use $@ to print  out all arguments at once
echo "Printing All Arguments At Once "
echo $@ 

else

    echo " Please Pass At least one Arguments to the Script"

fi



