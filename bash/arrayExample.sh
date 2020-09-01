#!/bin/bash

favorite_numbers=(3.14 2.718 .57721 4.6692)

echo "Pi : ${favorite_numbers[0]}"

favorite_numbers[4]=1.618

echo "GR : ${favorite_numbers[4]}"


#Add elements in Array
favorite_numbers+=(1 7)

#Display array using For Loop

for i in ${favorite_numbers[*]}; do
	echo $i
done

# Display Indexes
for j in ${favorite_numbers[@]}; do
        echo "Index $j"
done


#Array Length
echo "Array Length : ${favorite_numbers[@]}"

# Index of 3  Length
echo "Index 3 Length : ${favorite_numbers[3]}"



sorted_numbers=($(for i in "$favorite_numbers[@]}"; do
			echo $i;
done | sort ))
