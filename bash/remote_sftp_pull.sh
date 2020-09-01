#!/bin/bash
#================================================
# Author: Nitendra
#Date: 07/17/2019
# Description:                                            #
#=================================================
HOST=192.168.168.128
PASSWORD=maria_dev
USER=maria_dev
DIR_LOCATION=doc

expect - <<END
  spawn sftp -r -oPort=2222 ${USER}@${HOST}

  expect password:
  send "$PASSWORD\r"

  expect sftp>
  send "cd $DIR_LOCATION\r"

  expect sftp>
  send "ls \r ls -ltr"

  expect sftp>

  send "quit\r"
  expect eof
  exit 0
END
