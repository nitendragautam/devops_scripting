#!/bin/bash


read -p "Enter a number : " num


if (( num == 10 )); then
	echo "Your numer equals 10 "
elif (( num > 10 )); then
	echo "It is greater then 10"
else
    echo "It is less then 10"

fi

# Check Even or Odd
if (( ((num % 2)) == 0 )); then
	echo "It is even"
else
	echo "It is odd"
fi


# Logical Operrators

if (( ((num > 0 )) && ((num < 11)) )); then
	echo "$num is between 1 and 10"
fi


# Creating a file and checking if it exists or not 

touch sample_file && vim sample_file

# Check if sample directry does not exists or not
# If does not exist make a sample directory
[ -d sample_dir ] || mkdir sample_dir