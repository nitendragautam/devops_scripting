#!/bash/bin

## Searching for files with jpg extension Files in a directory using For Loop
HOME_DIR=/home/nitendragautam

# Loop through the PDF Files
for files in ${HOME_DIR}/*.jpg;

  do
  jpg_file=$files

  echo "Found jpg File $jpg_file"
  done
