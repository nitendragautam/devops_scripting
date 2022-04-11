#!/bin/bash

## String Manipulation
str1=nitendratech
echo $str1

str2="nitendratech"
echo $str2

str3='nitendragautam'
echo $str3

# Check if String is empty or not
if [ "$str1" ]; then
    echo "Value of str1: $str1 is not null"
fi

#Check if String has value or not
if [[ -z "$str1" ]]; then
    echo "Value of str1: $str1 has no value"
else
    echo "Value of str1: $str1 has Certain value"
fi

# Comparing two String values

if [[ "$str2" = "$str3" ]]; then
    echo "$str2 equals $str3 "
elif [[ "$str2" != "$str3" ]]; then
    echo "$str2 is not equal to $str3"
fi


# Check if Strings are greater than or smaller than based on  Alphabetical Ordering


if [ "$str2" > "$str3" ]; then
    echo "$str2 is greater then $str3"
elif [ "$str2" < "$str3" ]; then
    echo "$str2 is less than $str3"
fi
