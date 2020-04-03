#!/bin/bash

# Example of Running the Function in Background and waiting for it to finish

funtion print_my_name () {
  my_name=$1

echo "My Name is $my_name"
sleep 5s
}


echo "Calling the function for first time"

print_my_name nitendra &

echo "Calling the function for second time"
print_my_name gautam &

# Waiting for the process to finish
wait
echo "Both the functions are finished"
