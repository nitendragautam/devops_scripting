#!/bin/bash

## Check/Validate Shell Script Number of Arguments
## It will give total arguments passed to script
## example
# ./check_num_args.sh nitendra gautam
#nitendra gautam


NUM_ARGS=$#

if [ $NUM_ARGS - eq 2 ]
  then

  arg_1=$1
  arg_2=$2
else
echo "Invalid arguments passed"
exit 1
fi

echo "$arg_1 $arg_2"
