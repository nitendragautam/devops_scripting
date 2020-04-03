#!/bin/bash


$SPARK_HOME/bin/spark-submit \
 --class com.nitendragautam.loganalyticsjob.main.ApplicationBoot \
--master spark://192.168.133.128:7077 \
--deploy-mode cluster \
--supervise \
--executor-memory 2G \
--total-executor-cores 1 \
/home/hduser/loganalyticsjob.jar \
/home/hduser/logAnalyticsjob/input \
/home/hduser/logAnalyticsjob/output 
