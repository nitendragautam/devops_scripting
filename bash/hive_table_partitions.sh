#!/bin/bash

#===============================================================================================================================
#Author                : Nitendra Gautam
#Creation Date         : 06/29/2019
#Description           : Lists the Hive Tables and Partitions
#
#=============================================================================================================================

NUM_ARGS=$#

if [[ $NUM_ARGS -eq 1 ]];then
HIVE_DB=$1

else
echo "Enter the Correct Database Name"

fi

SCRIPT_PATH=`pwd`

TABLE_LIST=$SCRIPT_PATH/table_partition_list.txt

echo "$HIVE_DB" >> $TABLE_LIST

HIVE_TABLES=$(hive -e "USE $HIVE_DB;SHOW TABLES;")


for i in $(echo $HIVE_TABLES |tr ' ' '\n');

	do HIVE_TABLE_NAME=$i;
			echo "$HIVE_TABLE_NAME" >> $TABLE_LIST
			echo "\n"
      hive -e "USE $HIVE_DB; SHOW PARTITIONS $HIVE_TABLE_NAME;" >> $TABLE_LIST
	done
