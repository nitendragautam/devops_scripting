#!/bin/bash


echo "Running a PySpark Job in HDP 3"
pyspark --jars /usr/hdp/current/hive_warehouse_connector/hive-warehouse-connector-assembly-1.0.0.3.0.1.0-187.jar \
--py-files /usr/hdp/current/hive_warehouse_connector/pyspark_hwc-1.0.0.3.0.1.0-187.zip
