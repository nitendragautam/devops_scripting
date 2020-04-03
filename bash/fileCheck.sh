#!/bin/bash


file1="./test_file1"
file2="./test_file2"

# Check if file exists

if [ -e "$file1" ]; then
	echo "$file1 exists"
	
	if [ -f "$file1" ]; then
		echo "$file1 is a normal file "
	fi

	if [ -r " $file1 " ]; then
		echo "$file1 is readable "
	fi

	if [ -w "$file1" ]; then
		echo "$file1 is writable"
	fi

else
	echo "$file1 does not exists"
fi
