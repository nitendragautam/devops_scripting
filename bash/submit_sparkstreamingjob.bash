#!/bin/bash


$SPARK_HOME/bin/spark-submit \
 --class com.nitendragautam.sparkstreaming.main.Boot \
--master spark://192.168.133.128:7077 \
--deploy-mode cluster \
--supervise \
--executor-memory 4G \
--total-executor-cores 1 \
/home/hduser/sparkstreamingjob.jar
