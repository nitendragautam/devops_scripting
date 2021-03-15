#!/bin/bash

##########################
## Author: nitendratech.com
## Description: Gets five Parameter from command line and prints them 
##########################

print_param(){

    local first_param=$1
    local second_param=$2
    local third_param=$3
    local fourth_param=$4
    fifth_param=$5

echo "Printing from $FUNCNAME function  "


echo $first_param
echo $second_param
echo $third_param
echo $fourth_param
echo $fifth_param

## Using the unset to Make the variable fifth_param dissapear when the function exits
echo "Unsetting the Fifth Parameters "
unset fifth_param
}

NUM_PARAMS=$#

echo "Number of Parameters Passed " $NUM_PARAMS

# Variable Name with underscror 
_CURRENT_SCRIPT_NAME=$0

echo "Current Script Name " ${_CURRENT_SCRIPT_NAME}

echo "All Positiona Parameters Exccept Zero " $*

echo "All Positiona Parameters Exccept Zero " $@


echo "FIve Input Parameters $1 $2 $3 $4 $5"


## Calling Function to print Parameter
print_param $1 $2 $3 $4 $5

echo "Printing Global Variables"

echo "Home Directory $HOME"

echo "Preset Working Directory $PWD"

echo "Random Number $RANDOM"

echo ""
echo "$PATH"
