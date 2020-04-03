#!/bin/bash
#====================
#Starts the Spark Shell for HDP 3
#======

echo "Running a sPARK Shell Job in HDP 3"

/usr/hdp/current/spark2-client/bin/spark-shell \
--conf spark.sql.hive.hiveserver2.jdbc.url="jdbc:hive2://192.168.168.128:2181/;serviceDiscoveryMode=zooKeeper;zooKeeperNamespace=hiveserver2" \
spark.hadoop.hive.zookeeper.quorum="192.168.168.128:2181" \
--jars /usr/hdp/current/hive_warehouse_connector/hive-warehouse-connector-assembly-1.0.0.3.0.1.0-187.jar
