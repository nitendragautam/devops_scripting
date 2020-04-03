#!/bin/bash

str1=""
str2="Nitendra"
str3="Gautam"

# Check if String is empty or not
if [ "$str1" ]; then
    echo "$str1 is not null"
fi

#Check if String has value or not
if [[ -z "$str1" ]]; then
    echo "$str1 has no value"
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
