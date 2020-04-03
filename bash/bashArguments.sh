#!/bin/bash

#================================================
#  Example: ./bashArguments.sh  Bash Scripting Tutorials
#                                               #
#=================================================


#Use Predefined  Variables to Access Passed Arguments

#echo arguments to the Shell

echo $1 $2 $3 ' -> echo $1 $2 $3 '

#We can also store arguments from the bash command line in special array
args=("$@")

#Echo Arguments to the Shell
echo ${args[0]} ${args[1]} ${args[2]} ' -> args=("$@"); echo ${args[0]} ${args[1]} ${args[2]} '

# Use $@ to print  out all arguments at once
echo $@ ' -> echo $@'

# Use $# Variable to print out
# Number of Arguments Passed to the Bash Script

echo Number of Arguments Passed: $# ' -> echo Number of Arguments Passed: $#'

