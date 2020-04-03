#!/bin/bash

#Define Global Variable

# This Variable is Global and  can be used  anywhere in the Script
VAR="Global Variable"


function bash {

#Define a local variable which is local to this fucntion  only

local VAR="Local Variable"

echo "Within the bash Function"

echo $VAR
}

echo $VAR
bash

#Bash Global Variable did not change

#local is reserved word in bash
echo $VAR
