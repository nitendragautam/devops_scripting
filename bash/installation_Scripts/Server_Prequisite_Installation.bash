#!/bin/sh

#.Install ssh client and server and rsync
sudo apt-get update
sudo apt-get install openssh-client openssh-server
sudo apt-get install rsync
 sudo apt-get install telnetd
 
#Adding hduser
sudo adduser hduser

#Adding the hduser in the sudoers list 
sudo visudo -f /etc/sudoers

# User privilege specification
#Paste this in the file 
root    ALL=(ALL:ALL) ALL
hduser  ALL=(ALL:ALL) ALL


# installation of Oracle Java JDK.
sudo apt-get install software-properties-common
sudo apt-get -y install python-software-properties
sudo apt-add-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer


#we'll need to facilitate localhost to localhost 
#passwordless connection.

#6.generate ssh key  and make cluster passwordless
# for hduser and hostname localhost

# Generate ssh key and make the setup passwordless 
ssh-keygen -t rsa -P ''
cp .ssh/id_rsa.pub .ssh/authorized_keys

#Test the passwordless key in cluster
ssh localhost
#Not needed to add the Path of Java 
#Add the path of JAVA_HOME if not enabled for user 'hmaster'
#JAVA_HOME=/usr/lib/jvm/java-8-oracle/

#sudo echo " 
##Java Environment Variable
#export JAVA_HOME=/usr/lib/jvm/java-8-oracle">> ~/.bashrc 
#sudo echo "export PATH=$JAVA_HOME/bin:$PATH" >> ~/.bashrc 
