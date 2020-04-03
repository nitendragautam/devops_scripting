#!/bin/sh

#Download the latest version of Flume available
sudo wget http://www-us.apache.org/dist/flume/1.6.0/apache-flume-1.6.0-bin.tar.gz



sudo cp apache-flume-1.6.0-bin.tar.gz /usr/local/

sudo tar -xzf apache-flume-1.6.0-bin.tar.gz
sudo mv apache-flume-1.6.0-bin ./flume

#Change ownership and permission of the downloaded flume directory 
sudo chmod -R 755 /usr/local/flume
sudo chown -R hduser /usr/local/flume


#add the flume installation path to bashrc location as hduser 
nano ~/.bashrc

#Inside bashrc file add f
export FLUME_HOME=/usr/local/flume
export PATH=$FLUME_HOME/bin:$PATH

source ~/.bashrc

#Check if Flume has been installed correctly 
flume-ng version 

#If you get messages without any errors ,then installation is successful.
