
#1.Install Linux minimal from ubuntu website

#2.Install ssh client and server and rsync
sudo apt-get update
sudo apt-get install openssh-client openssh-server
sudo apt-get install rsync


#3.To connect the linux environment use the command dhclient to generate the ip address being the root user
$dhclient   :Assisgns a ip address for certain time
 
#Use the ssh to connect to the ip address of the intsalled server using PuTTY/MobaXterm
$ssh hmaster@ip-address

#4.Add a dedicated user hduser and adding  it in the sudoers list

#Adding hduser
$sudo adduser hduser


#Adding the hduser in the sudoers list 
$sudo visudo -f /etc/sudoers

# User privilege specification
#Paste this in the file 
root    ALL=(ALL:ALL) ALL
hduser  ALL=(ALL:ALL) ALL


#4.Install other Prequiste for Hadoop 

#Install Java (Oracle Java)
#Install thsese first
sudo apt-get install software-properties-common

#Install Java
sudo apt-add-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer

#Configure the java program
sudo update-alternatives --config java

#Add the path of JAVA_HOME if not enabled for user 'hduser'
#JAVA_HOME=/usr/lib/jvm/java-8-oracle/

sudo echo " 
#Java Environment Variable
export JAVA_HOME=/usr/lib/jvm/java-8-oracle
export PATH=$JAVA_HOME/bin:$PATH" >> ~/.bashrc 

#reread bashrc
source ~/.bashrc

#5.Install Hadoop on /usr/local/hadoop 

#Download Hadoop
HADOOP_VERSION=hadoop-2.7.1
 wget https://archive.apache.org/dist/hadoop/common/$HADOOP_VERSION/$HADOOP_VERSION.tar.gz
 

#Untar the tar file
 tar xvzf $HADOOP_VERSION.tar.gz

#Create necessary directory for Hadoop 
mkdir /usr/local/hadoop

#Changing ownership and permissions on that directory
chown -R hduser /usr/local/hadoop
chmod 755 /usr/local/hadoop

#move the hadoop untar file to /usr/local/hadoop
mv $HADOOP_VERSION /usr/local/hadoop


#6.generate ssh key  and make cluster passwordless for hduser and hostname localhost

# Generate ssh key and make the setup passwordless 
ssh-keygen -t rsa -P ''
cp .ssh/id_rsa.pub .ssh/authorized_keys

#Test the passwordless key in cluster
ssh localhost


7.Make directory for namenode,datanode and secondary name node 
and give necessary permissions to them 

# make folders for namenode & datanode & secondary namenode
sudo mkdir -p /usr/local/hadoop_store/hdfs/namenode
sudo mkdir -p /usr/local/hadoop_store/hdfs/datanode
sudo mkdir -p /usr/local/hadoop_store/hdfs/secondarynamenode
sudo mkdir -p /usr/local/hadoop_store/hdfs/local 

#give rights and proper permission to selected user in hadoop_store
sudo chown -R hduser /usr/local/hadoop_store/
sudo chmod 755 /usr/local/hadoop_store/

8.configure hdfs-site.xml and mapred-site.xml ,yarn-site.xml,core-site.xml
#Make the directory for core-site.xml
mkdir -p /usr/local/app/hadoop/tmp
sudo chown -R hduser /usr/local/app/
sudo chmod 755 /usr/local/app/


#Update the core-site.xml

sudo echo "<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="configuration.xsl"?>
<configuration>
 <property>
  <name>hadoop.tmp.dir</name>
  <value>/usr/local/app/hadoop/tmp</value>
  <description>A base for other temporary directories.</description>
 </property>
 <property>
  <name>fs.defaultFS</name>
  <value>hdfs://192.168.133.128:9000</value>
  <description>The name of the default file system. 
         </description>
 </property>
</configuration>" >/usr/local/hadoop/etc/hadoop/core-site.xml




# add configuration to mapred-site.xml

cp /usr/local/hadoop/etc/hadoop/mapred-site.xml.template /usr/local/hadoop/etc/hadoop/mapred-site.xml

sudo echo "<?xml version="1.0">
<?xml-stylesheet type="text/xsl" href="configuration.xsl"?>

<!-- Put site-specific property overrides in this file. -->

<configuration>
<property>
  <name>mapred.job.tracker</name>
  <value>192.168.133.128:54311</value>
  <description>The host and port that the MapReduce job tracker runs
  at.  If "local", then jobs are run in-process as a single map
  and reduce task.
  </description>
 </property>
 <property>
      <name>mapreduce.cluster.temp.dir</name>
      <value>/tmp</value>
      <final>true</final>
   </property>
   <property>
      <name>mapreduce.cluster.local.dir</name>
      <value>/usr/local/hadoop_store/hdfs/local</value>
      <final>true</final>
   </property>
   <property>
      <name>mapreduce.job.maps</name>
      <value>2</value>
      <description>The default number of map tasks per job.</description>
   </property>
   <property>
      <name>mapreduce.job.reduces</name>
      <value>1</value>
      <description>The default number of reduce tasks per job. 
          Typically set to 99% of the cluster's reduce capacity, so 
          that if a node fails the reduces can still be executed in a 
          single wave
</description>
   </property>
   <property>
     <name>mapreduce.jobtracker.taskscheduler</name>
     <value>org.apache.hadoop.mapred.JobQueueTaskScheduler</value>
     <description>The class responsible for scheduling the tasks.</description>
   </property>
   <property>
     <name>mapreduce.job.counters.limit</name>
     <value>120</value>
     <description>Limit on the number of user counters allowed per 
         job.
     </description>
   </property>
</configuration>"> /usr/local/hadoop/etc/hadoop/mapred-site.xml


# add configuration to hdfs-site.xml
sudo echo "<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="configuration.xsl"?>
<configuration>
 <property>
  <name>dfs.replication</name>
  <value>1</value>
  <description>Default block replication.
  The actual number of replications can be specified when the file is created.
  The default is used if replication is not specified in create time.
  </description>
 </property>
 <property>
   <name>dfs.namenode.name.dir</name>
   <value>file:/usr/local/hadoop_store/hdfs/namenode</value>
   <description>Determines where on the local filesystem the DFS
          name node should store the name table(fsimage).If this is
          comma-delimited list of directories then the name table 
          is replicated in all of the directories, for redundancy. 
      </description>
 </property>
 <property>
     <name>dfs.namenode.name.dir.restore</name>
     <value>true</value>
     <description>Set to true to enable NameNode to attempt 
         recovering a previously failed dfs.namenode.name.dir. 
         When enabled, a recovery of any failed directory is 
         attempted during checkpoint.</description>
   </property>
 <property>
   <name>dfs.datanode.data.dir</name>
   <value>file:/usr/local/hadoop_store/hdfs/datanode</value>
   <description>Determines where on the local filesystem an DFS 
         data node should store its blocks. If this is a 
         comma-delimited list of directories,then data will be 
         stored in all named directories, typically on different 
         devices.Directories that do not exist are ignored.
     </description>
 </property>
 <property>
     <name>dfs.namenode.checkpoint.dir</name>
     <value>file:/usr/local/hadoop_store/hdfs/secondarynamenode</value>
     <description>Determines where on the local filesystem the DFS 
         secondaryname node should store the temporary images to 
         merge.If this is comma-delimited list of directories then
         the image is replicated in all of the directories for 
         redundancy.</description>
   </property>
   <property>
     <name>dfs.permissions</name>
     <value>false</value>
   </property>

</configuration>" >/usr/local/hadoop/etc/hadoop/hdfs-site.xml
	

# change JAVA_HOME in hadoop-env.sh
sed -i 's/export JAVA_HOME=${JAVA_HOME}/export JAVA_HOME=\/usr\/lib\/jvm\/java-8-oracle/' /usr/local/hadoop/etc/hadoop/hadoop-env.sh


#Update the bashrc File

nano ~/.bashrc 

#HADOOP VARIABLES START
export HADOOP_HOME="/usr/local/hadoop"
export PATH="$HADOOP_HOME/bin:$PATH"
export PATH="$HADOOP_HOME/sbin:$PATH"
export HADOOP_MAPRED_HOME="$HADOOP_HOME"
export HADOOP_COMMON_HOME="$HADOOP_HOME"
export HADOOP_HDFS_HOME="$HADOOP_HOME"
export YARN_HOME="$HADOOP_HOME"
export HADOOP_COMMON_LIB_NATIVE_DIR="$HADOOP_HOME/lib/native"
export HADOOP_OPTS="-Djava.library.path=$HADOOP_HOME/lib"
#HADOOP VARIABLES END 

#reread the bashrc
source ~/.bashrc

#9.Check all the file permission in /usr/local/hadoop directory for user hduser

Create Directory for YARN
mkdir - R /usr/local/app/hadoop-yarn/staging
sudo chown -R hduser /usr/local/app/
sudo chmod 755 /usr/local/app/


#10.Initialize Name Node
hadoop namenode format


#11.start the dfs and yarn daemons (need to run this before using hadoop )
start-dfs.sh
start-yarn.sh


#12.Check the running daemons by typing jps

#Check hadoop filesystem 
hadoop fs -ls /

#Make File 
hadoop fs -put /home/hduser/NDSHadoopJob/input/ /user/hduser/input/
hadoop fs -put /home/hduser/NDSHadoopJob/input/74-0.txt  /user/hduser/input/
#Put File
hadoop fs -put /home/hduser/
#Submit Hadoop Job
hadoop jar /home/hduser/mapreducelearning-1.jar com.nitendragautam.mapreducelearning.wordcount.WordCount /user/hduser/input/ /user/hduser/output/