#!/bin/bash

## For loop Examples

echo "Printing Valus from 1 to 5 "
for i in {1..5}
do
  printf "Welcome $i "
done

echo "Printing Values from A to Z "
for alpthabet_char in  {A..Z}; do
	printf "$alpthabet_char \t"
done

for i in 1 2 3 4 5
do
	print("\n")
  printf "Welcome $i "
done
