#!/bin/bash


curl -X POST http://192.168.133.128:6066/v1/submissions/create --header "Content-Type:application/json;charset=UTF-8" --data '{
  "appResource": "/home/hduser/sparkbatchapp.jar",
  "sparkProperties": {
    "spark.executor.memory": "4g",
    "spark.master": "spark://192.168.133.128:7077",
    "spark.driver.memory": "4g",
    "spark.driver.cores": "2",
    "spark.eventLog.enabled": "false",
    "spark.app.name": "Spark REST API201804291717022",
    "spark.submit.deployMode": "cluster",
    "spark.jars": "/home/hduser/sparkbatchapp.jar",
    "spark.driver.supervise": "true"
  },
  "clientSparkVersion": "2.0.1",
  "mainClass": "com.nitendragautam.sparkbatchapp.main.Boot",
  "environmentVariables": {
    "SPARK_ENV_LOADED": "1"
  },
  "action": "CreateSubmissionRequest",
  "appArgs": [
    "/home/hduser/NDSBatchApp/input",
    "/home/hduser/NDSBatchApp/output/"
  ]
}'