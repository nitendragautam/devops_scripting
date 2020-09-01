#!/bin/bash

echo "While Loop Example which will loop from 1 to 20"
num=1

while [ $num -le 20 ]; do
	if(( ((num % 2)) == 0 )); then
	num=$((num + 1 ))
	continue
	fi

	if (( num >=15 )); then
		break
	fi

	echo $num
	num=$((num + 1 ))
done
