#!/bin/bash


TO_ADDRESS="recipient@domain.com"
FROM_ADDRESS="sender"
EMAIL_SUBJECT="Linux mail with attachment example"
BODY_FILE="/home/nitendragautam/bodyfile.dat"
ATTACHMENT_FILE="/home/nitendragautam/attachmentfile.txt"
CC_LIST="user1@gmail.com,user2@gmail.com,user3@gmail.com"


uuencode ${ATTACHMENT_FILE} | mail -s %{EMAIL_SUBJECT} -c ${CC_LIST} ${TO_ADDRESS} -- -r ${FROM_ADDRESS} < ${BODY_FILE}
