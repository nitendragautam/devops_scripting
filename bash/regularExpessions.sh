#!/bin/bash


num=12345678

#Pattern is any numerical number should be 8 characters long 
pattern="^[0-9]{8}$"

#Check the pattern

if [[ $num =~ $pattern ]]; then
	echo "$num is valid"
else
echo "$num is not valid"
fi


