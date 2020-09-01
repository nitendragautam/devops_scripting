#!/bin/bash

HOME_DIR=/home/nitendratech

echo "Home Directory $HOME_DIR"
for files in `ls $HOME_DIR`;
  do
  echo "Found file $files"
  echo "File Path: ${HOME_DIR}/$files"
done
