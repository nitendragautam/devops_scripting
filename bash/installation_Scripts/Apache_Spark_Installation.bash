#!/bin/sh

#Prequisite :Install Java and rsync Server 

# Installation of scala
sudo apt-get remove scala-library scala
wget http://www.scala-lang.org/files/archive/scala-2.11.8.deb
sudo dpkg -i scala-2.11.8.deb
sudo apt-get update

# Installation of sbt
wget http://dl.bintray.com/sbt/debian/sbt-0.13.12.deb
sudo dpkg -i sbt-0.13.12.deb
sudo apt-get -y update

#Install git as spark depends upon Git
sudo apt-get install git


#Install git as spark depends upon Git
sudo apt-get install git

# Downloading spark
sudo wget http://d3kbcqa49mib13.cloudfront.net/spark-2.0.1-bin-hadoop2.7.tgz
tar -zxf spark-2.0.1-bin-hadoop2.7.tgz
sudo mv spark-2.0.1 /usr/local/spark


#Changing ownership and permissions on that directory
sudo chown -R hduser /usr/local/spark
sudo chmod 755 /usr/local/spark


#Add SPARK_HOME in the end of the bashrc file as a root user
nano ~/.bashrc
export SPARK_HOME=/usr/local/spark/
export PATH=$SPARK_HOME/bin:$PATH
source ~/.bashrc


# Clean-up the downloaded files from respective directory
rm scala-2.10.6.deb
rm sbt-0.13.11.deb
rm spark-1.6.1.tgz



#Spark master requires passwordless ssh 
#login to its slaves, and since we're building a standalone Spark cluster, 
#we'll need to facilitate localhost to localhost passwordless connection.

#.generate ssh key  and make cluster passwordless for hduser and hostname localhost

# Generate ssh key and make the setup passwordless 
ssh-keygen -t rsa -P ''
cp .ssh/id_rsa.pub .ssh/authorized_keys

#Test the passwordless key in cluster
ssh localhost


#Navigate to $SPARK_HOME/conf and copy slaves.template as slaves # By Default 
cd /usr/local/spark/conf
cp slaves.template ./slaves




# create spark-env.sh file using the provided template:
cp ./conf/spark-env.sh.template ./conf/spark-env.sh

# append a configuration param to the end of the file:
#export SPARK_MASTER_IP=XXX.XXX.XXX

#Check the connection to this Master IP Using this command
#spark-shell --master spark://localhost:7077





#Start the Spark Master and Slaves 
# start the Spark master on your localhost:
$SPARK_HOME/sbin/start-master.sh

# just press enter both times, when asked for password
Reference :https://help.ubuntu.com/12.04/serverguide/openssh-server.html#openssh-keys


