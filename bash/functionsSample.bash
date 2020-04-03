#!/bin/bash


#getDate Function

getDate(){

date

return
}


# call Function
getDate


# Global Variable whcih is available through out the Script
name="Nitendra"


# Local Variable which is available only in the function locally

demLocal(){

local name="Gautam"

return
}


demLocal

echo "$name"



getSum(){
local num3=$1
local num2=$2

local sum=$((num3+num4))

echo $sum
}

num1=5
num2=6

sum=$(getSum num1 num2)

echo "The sum is $sum"




## Function which takes two parameters
function printMyName(){
first_name=$1
last_name=$2
echo "My Name is $first_name $last_name"

}

printMyName Nitendra Gautam
