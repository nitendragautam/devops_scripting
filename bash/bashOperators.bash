#!/bin/bash

# Declaring constants in bash
declare -r NUM1=5


#Declaring Variables
num2=4

num3=$((NUM1 +num2))
num4=$((NUM1 - num2))
num5=$((NUM1*num2))
num6=$((NUM1/num2))

echo "Addition result = $num3"
echo "subtraction result = $num4"
echo "Multiplication Result =$num5"
echo "division Result =$num6"



# Square operation
echo $((5 **2 ))
# Modulus 
echo $(( 5%4 ))


random=5
#Increementing Values
let random+=4  
echo "$random"


#Increment and Decrement 

echo "Increment After printing: random++ = $(( random++ ))"
echo "Increment before printing random: ++random = $((++random ))"
echo "Decrement after printing random: random-- = $(( random-- ))"
echo "decrement before  printing random: --random = $(( --random))"


num7=1.2

num8=3.4

# Running Python in bash
num9=$(python -c "print $nume7+$num8")

echo " output from Python $num9"


echo "Printing Multi Lines using Cat "

cat<< END 
This text 
prints Many Lines
END


