#!/bin/bash

# In this Script we wil pass multi values seperated by commad and loop it through
# Using For Loop


NUM_ARGS=$#

echo "Number of Arguments $NUM_ARGS"
if [ $NUM_ARGS -eq 1 ];then
passed_value=$1
else
  echo "Pass Values Seperated by comma"
exit 1
fi

## Using for loop and trim command to read the values seperated by comma
for value in $(echo $passed_value|tr ',' '\n')
  do
  echo "Passed Values $value"
done
