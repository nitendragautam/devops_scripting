#Prequisite :Java ,Rsync Sevrr , Add user hduser 

sudo su hduser 

#Donwload Apache Zookeeper from website 
sudo wget http://shinyfeather.com/zookeeper/stable/zookeeper-3.4.9.tar.gz
sudo tar -zxf zookeeper-3.4.9.tar.gz
sudo mv zookeeper-3.4.9 /usr/local/zookeeper

#Changing ownership and permissions on that directory aftter changing it to user hduser
sudo chown -R hduser /usr/local/zookeeper
sudo chmod 755 /usr/local/zookeeper

#Add ZOOKEEPER_HOME to path  of hduser
nano ~/.bashrc

#Add these in bashrc file
export ZOOKEEPER_HOME=/usr/local/zookeeper
export PATH=$ZOOKEEPER_HOME/bin:$PATH

source ~/.bashrc

#Navigate to $ZOOKEEPER_HOME/conf 
cd $ZOOKEEPER_HOME/conf

#Rename the zoo_sample.cfg zoo.cfg
sudo mv zoo_sample.cfg zoo.cfg 

#Make a directory named data inside /user/local/zookeeper/ for zookeper data from user hduser
cd $ZOOKEEPER_HOME
mkdir data
sudo chown -R hduser /usr/local/zookeeper/data
sudo chmod 755 /usr/local/zookeeper/data

#Go to zoo.cfg in side $ZOOKEEPER_HOME and edit dataDir and save the file
dataDir=/user/local/zookeeper/data

#Make a directory named logs in $ZOOKEEPER_HOME 
cd $ZOOKEEPER_HOME
mkdir logs
sudo chown -R hduser /usr/local/zookeeper/logs
sudo chmod 755 /usr/local/zookeeper/logs

#Open the log4j.properties in configuration and uncomment lines 
log4j.rootLogger=DEBUG, CONSOLE, ROLLINGFILE

#Add the logs and trace logs location in th efile
zookeeper.log.dir=$ZOOKEEPER_HOME/logs


#Download the Kafka from the web site
sudo wget http://mirror.atlanta.delimiter.com/pub/apache/kafka/0.10.1.0/kafka_2.11-0.10.1.0.tgz

#Untar the kafka tar ball
sudo tar -zxf kafka_2.11-0.10.1.0.tgz

#Move the untarred kafka file to /usr/local/ and rename it 
sudo mv kafka_2.11-0.10.0.0 /usr/local/kafka

#Changing ownership and permissions on that directory aftter changing it to user hduser
sudo chown -R hduser /usr/local/kafka
sudo chmod 755 /usr/local/kafka

#Give permissions for kafka logs 
sudo chown -R hduser /usr/local/kafka/logs
sudo chmod 755 /usr/local/kafka/logs

#Add the KAFKA_HOME Path to .bashrc being the kafka user

nano ~/.bashrc

export KAFKA_HOME=/usr/local/kafka
export PATH=$KAFKA_HOME/bin:$PATH

source ~/.bashrc

#Add below to /etc/security/limits.conf at the end for number of files Open
sudo nano /etc/security/limits.conf
kafka    -    nofile    98304

#Configure and start 3 Kafka brokers

#Create data directory for Kafka Logs



#Navigate to $KAFKA_HOME and make a directory data
cd $KAFKA_HOME/data
mkdir kafka-logs-1
mkdir kafka-logs-2
mkdir kafka-logs-3

sudo chown -R hduser /usr/local/kafka/data
sudo chmod 755 /usr/local/kafka/data

#Open /etc/hosts and add Machine IP Address  and host name
sudo /etc/hosts

192.168.184.131 hmaster



#To send large files to Kafka make following changs in config file in server.properties 
#Add use Topic Level Config
# > bin/kafka-topics.sh --zookeeper localhost:2181 --create --topic my-topic --partitions 1
   #       --replication-factor 1 --config max.message.bytes=64000 --config flush.messages=1
#

message.max.bytes=112640000

#Check https://kafka.apache.org/documentation#brokerconfigs for details
#For first Kafka Brokers navigate to /usr/local/kafka and copy the config files 
sudo cp $KAFKA_HOME/config/server.properties $KAFKA_HOME/config/server1.properties

#Edit config/server1.properties and replace the existing config values as follows:

broker.id=1
port=9093
listeners=PLAINTEXT://hmaster:9093
log.dir=/usr/local/kafka/data/kafka-logs-1
zookeeper.connect=hmaster:2181
advertised.listeners=PLAINTEXT://hmaster:9093

#For second Broker The second broker:
sudo cp $KAFKA_HOME/config/server.properties $KAFKA_HOME/config/server2.properties

#Edit config/server2.properties and replace the existing config as follows
broker.id=2
port=9094
log.dir=/usr/local/kafka/data/kafka-logs-2
listeners=PLAINTEXT://hmaster:9094
zookeeper.connect=hmaster:2181
advertised.listeners=PLAINTEXT://hmaster:9094
#Create the config file for broker 3
sudo cp $KAFKA_HOME/config/server.properties $KAFKA_HOME/config/server3.properties

#Edit config/server3.properties and replace the existing config as follows

broker.id=3
port=9095
log.dir=/usr/local/kafka/data/kafka-logs-3
listeners=PLAINTEXT://hmaster:9095
advertised.listeners=PLAINTEXT://hmaster:9095
zookeeper.connect=hmaster:2181


#To use the console based Producer and consumer Modify the producer.properties and consumer.properties
#Navigate to $KAFKA_HOME/config/ and add following to consumer.properties and producer.properties

zookeeper.connect=hmaster:2181


#Make sure telnetd is installed 

sudo apt-get install telnetd

#Start Zookeper in kafka pointing towards the zookeeper installation file beconing a hduser

$KAFKA_HOME/bin/zookeeper-server-start.sh $ZOOKEEPER_HOME/conf/zoo.cfg &

#start each Kafka broker in a separate console:
#Start the first broker in its own terminal session/
$KAFKA_HOME/bin/kafka-server-start.sh $KAFKA_HOME/config/server1.properties &

#Start the second broker in its own terminal session
 $KAFKA_HOME/bin/kafka-server-start.sh $KAFKA_HOME/config/server2.properties &

#Start the third broker in its own terminal session
$KAFKA_HOME/bin/kafka-server-start.sh $KAFKA_HOME/config/server3.properties &



#Sending Sample Message in Kafka(make sure all brokers are running)
#Creating Topics
#Creating two Topics in Kafka for log analytics project
sudo $KAFKA_HOME/bin/kafka-topics.sh --create --zookeeper 192.168.184.131:2181 --replication-factor 1 --partitions 1 --topic ndsloganalytics_raw_events
sudo $KAFKA_HOME/bin/kafka-topics.sh --create --zookeeper 192.168.184.131:2181 --replication-factor 1 --partitions 1 --topic ndsloganalytics_processed_events


#Create 
#List Topics
sudo $KAFKA_HOME/bin/kafka-topics.sh --list --zookeeper 192.168.184.131:2181 

#Describe Topics 

kafka-topics.sh --describe --zookeeper 192.168.184.131:2181 --topic ndsloganalytics_raw_events

#Delete Topics Kafka
sudo $KAFKA_HOME/bin/kafka-topics.sh --zookeeper 192.168.184.131:2181 --delete --topic ndsloganalytics_raw_events


#http://stackoverflow.com/questions/35788697/leader-not-available-kafka-in-console-producer

#Read message from Kafka Topics

sudo $KAFKA_HOME/bin/kafka-console-consumer.sh --bootstrap-server 192.168.184.131:9093 --topic ndsloganalytics_raw_events –consumer.config consumer.properties



#Produce Message in Topic
sudo $KAFKA_HOME/bin/kafka-console-producer.sh --broker-list 192.168.184.131:9093 --topic inputMessage  --producer.config producer.properties


#Read message from Kafka Topics form Beginning 


sudo $KAFKA_HOME/bin/kafka-console-consumer.sh --bootstrap-server 192.168.184.131:9093 --topic ndsloganalytics_raw_events –consumer.config consumer.properties --from-beginning


#Consumer
sudo $KAFKA_HOME/bin/kafka-console-consumer.sh --bootstrap-server 192.168.184.131:9093 --topic ndsloganalytics_raw_events –consumer.config consumer.properties


Reference 
http://www.michael-noll.com/blog/2013/03/13/running-a-multi-broker-apache-kafka-cluster-on-a-single-node/
https://www.digitalocean.com/community/tutorials/how-to-install-apache-kafka-on-ubuntu-14-04
https://developer.ibm.com/hadoop/2016/06/23/getting-started-with-kafka-2/




