#!/bash/bin
#In this example we see how we can add multiple lines to a text file
#We will also see how we can read line by line from a File
#
#
HOME_DIR=/home/nitendratech

input_file=${INPUT_DIR}/input_file.txt


## Add multiple lines to a text file using EOF

cat << EOT << $input_file
This is first line
This is second line
This is third line
EOT


## Read Line by line from a file
while read line
do

echo $line

done < $input_file
```
