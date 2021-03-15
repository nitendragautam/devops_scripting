#!/bin/bash


echo "Script that takes Two inputs and Subtract them"

echo -n "Enter the first Number: "
read -r FIRST_NUM

echo -n "Enter the Second Number: "
read -r SECOND_NUM

TOTAL_DIFFERENCE=$(($FIRST_NUM - $SECOND_NUM))
echo "Sum of Two Numbers is : " $TOTAL_DIFFERENCE