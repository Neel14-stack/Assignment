## HDFS AArchitecture

### In HDFC architecture we have manily 2 things Name Node (Master service)
- Name Node is a master service that stores metadata of each data blocks (location, size , no of replicas, permission)
- then we have racks and node which store our blocks...

when our one cluster is corrupted its mater service (name node) duty to find its replicas and continue with the process, and we always
out put our different blocks in different nodes for example if our block b1 and b2 are in rack 1 with cluster number 2 but when we replicated 
them into another rack with cluster we will put block b1 in different cluster and block b2 in different cluster 

![WhatsApp Image 2023-03-16 at 12 35 19 PM](https://user-images.githubusercontent.com/54886608/225540343-d110c80f-adea-4cb9-b8ed-3dc68ac56913.jpeg)


- Replicas = dfs.replica = 3 (default)
- Replicas will be stored in such way that no two same blcoks are places within same data node.
- HDFS manages data block in such a way that it is always highly avaiable.


Cluster -> 



## Issue with Hadoop 1.0
- In Hadoop there is no concept of multiple namenode so namenode get down in regular interval.
- to overcome this Hadoop 2.0 introduce which have multiple name node
- And we uses Hadoop 2.0

## HDFS VERSION 2.0
- we have FSImaage
- and Logs
- we have more than one namenode called as active passive namenode

![WhatsApp Image 2023-03-16 at 12 53 30 PM](https://user-images.githubusercontent.com/54886608/225543763-a017d15a-bc14-4890-b0a9-e2f2c2dcc41a.jpeg)

## Hadoop 2.o core components
- **Yarn is how to job should excute**
- ** while hdfs is how data is stored**
- 


* Edit logs : Change in FSImage from last snapshot
* FSImage: FSImage is point in time snapshot of HDFS cluster
* Namespaces : One of the content stored in FSImage, HDFS path to datablocks.

**When active namenode is down standby namenode works as a active namenode. and this is done by  coordinator (Zookeeper)**
- Zookeeper is a coordinator which check health status of active namenode.
- there are 3 zookeeper, if one goes down another one will replace it

![WhatsApp Image 2023-03-16 at 1 17 08 PM](https://user-images.githubusercontent.com/54886608/225549257-0e7e4597-bf04-4a92-a6d9-d9bbf3c8d75b.jpeg)

** Q. Is hadoop good for processing small no of large block size or large no of small size blocks ? **
- HDFS uses large block size to store data, which generates less no of namespaces resulting into less burdon on namenode
large no of small size block -> more metadata -> more resources required by namenode

** Q. Can multiple clients request to perform write to HDFS at same time**
- HDFS follows write once read many.

** Q. Namenode safemode **
- multile read operations are there but only one write operation will be allowed, and if someone else tries to write it will show Namenode is in safemode. HDFS goes into Read only Mode.
- To clinet will be allowed to perform write operation or update
- HDFS dfsadmin - safemode leave

** Q. What is heartbest in HDFS **
- In HDFS, heartbeat refers to the periodic signal sent by DataNodes to the NameNode to inform it that the DataNode is alive and functioning properly.
- DataNodes are responsible for storing and managing the actual data in HDFS. They send heartbeat signals to the NameNode every few seconds to inform it that they are still operational. This helps the NameNode keep track of the health of the DataNodes and detect any failures or network issues.

** Q. What is FSCK in Hadoop **
- File system check, which checks for any error and check the replication factor as well (important), check block size is managed or not

** Q. What happen when a data nodes goes down to replicas of datablocks **
- when data node goes down new replicas of blocks present in datanode will be created, when the datanode which wad won is up again the newly created datablcoks well automatically deleted.

** Q. How many blocks will be created for a file size of 130mb what will be size of datablocks **
- 2 Blocks will be created : 128mb + 2 mb

** Q. Whta is Disk balancer in HDFS **
- Balances data evenly across disk witin datanode

![Hadoop Quiz](https://user-images.githubusercontent.com/54886608/227125804-33d9bae2-0dd7-485e-97f1-e7ff50340961.png)



![HDFS Architechture](https://user-images.githubusercontent.com/54886608/227125670-6f661f93-7f5a-453a-b27d-cb0d48e055a5.png)


## YARN (YET ANOTHER RESOURCE NEGOTIATOR)

## 5 serives (3 from hdfs and 2 from yarn)
- Name node
- secondary name node
- data node
- resource node
- node manager

![Screenshot 2023-03-16 163653](https://user-images.githubusercontent.com/54886608/225600404-87ecc2cb-fbf7-47e7-b0ac-39d9e8d7c6d8.png)


### Application manager 
- responsible for accepting the job from job scheduler, then it will be asking the node manager where are the resouces and later it will get allocated container.
- for every single job there is a app master, and when the job is completed it get destoryed
- Application Manager negotiates with node manaer on resources.
- monior the running job status ssend by app master
- It restarts job on job excution failure


### Application Master
- it will be running one per each job submitted
- managing multiple containers and monitoring their resource usage
- app master destroy iitself after successful completion of job

### Node Manager
- it sends signal to resource manager at regular interval
- node manager is salve service
- node manager creates containers and application master on request of job 


![YARN Architecture (2)](https://user-images.githubusercontent.com/54886608/227125756-55f8cd16-bc8c-45b9-b473-f055f1f71684.png)



## to access hadoop and its all applicaton
- localhost:5070/
- localhost:8088/

## linux command
- jps (to see all the services running like (nodemanager, recoursemanager, datanode, secondarynamenode, namenode, jps)
- start-dfs.sh && start-yarn.sh (sh refers to shell)
- stop-dfs.sh && stop-yarn.sh

## 20/03 MAP REDUCE
whenever there is aggregate function there will be reducer

- there are 2 things in map reduce
- MAPPER JOB AND REDUCER JOB
- there might be alone MAPPER JOB but there wont be any case of SOLO REDUCER JOB 

![WhatsApp Image 2023-03-20 at 12 17 47 PM](https://user-images.githubusercontent.com/54886608/226266883-b1b599df-815e-4eae-b101-c4e2c5c60253.jpeg)

![WhatsApp Image 2023-03-20 at 12 17 46 PM](https://user-images.githubusercontent.com/54886608/226266930-20c3183e-ca7b-4f2c-93b3-4737cac9dbc9.jpeg)

![WhatsApp Image 2023-03-20 at 12 17 45 PM](https://user-images.githubusercontent.com/54886608/226266978-a365568e-25ab-456e-8e57-45ebe36bc685.jpeg)


### NOTES
- No of ballots is equal to no of teller
- no of blocks is equal to no of map job
- no of nodes is equal to no of reducer

** migration is map only jon **

** Why Madreduce
- prallel processing, all the jobs can run at same time
- time efficent
- we can define how mnay resultant file we need at the end using no of reducer

![WhatsApp Image 2023-03-20 at 12 27 27 PM](https://user-images.githubusercontent.com/54886608/226268527-52abe81a-8e60-489e-bdd2-e6992fd1c874.jpeg)


## SCOOP COMMANDS

## SCOOP IMPORT (MYSQL TO HDFS)
create new db\
create database db;\
show database;\
use db;\
create table table_name (schema of tablw with dataype , primary key);\
create table emp (empid int, empname varchar, salary int, department varchar);\
insert into tablename values(values seperated by  ',');\

sqoop import --connect jdbc:mysql:localhost/databasename --username root --password hadoop@123 --tabel emptable -m 2 --target-dir '/output/'\
** that -m 2 defines the number of map job, the more the number of map job will be the faster it will be **


## SCOOP EXPORT (HDFS TO MYSQL)
login in mysql\
command mysql -u root -p <press enter>\
hadoop@123\
  
change database name\
use amitdb;\
\
create new tabel in mysql \
create tabel if not exists emptable (empid int, empaname varchar(50), salary int, department varchar(60), designation vachar(60));\
\
create a new dir in HDFS and copy file to HDFS\
hdfs dfs -mkdir /Employee\
hdfs dfs -put /home/hadoop/downloads/EMployee.csv /Employee\
\  
\  
switch to new terminal\
sqoop export --connect jdbc:mysql://localhost/databasename --username root --passwor hadoop@123 --export-dir /employee/employee.csv --table employee --input-fields-terminated-by ',' --input lines-terminated-by '/n'\
  \
  \
  sqoop export --connect jdbc:mysql://localhost/databasename --username root --passwor hadoop@123 --export-dir /employee/employee.csv --table employee --input-fields-terminated-by ',' --input lines-terminated-by '/n'\
  

 ## SQOOP JOB COMMAND
  - sqoop list job\
  sqoop job --list\
  
  - show job\
  sqoop job --show jobname\
  
  - excute job\
  sqoop job --exec mynewjob\
  
  - delete job\
  sqoop job --delete jobname\
  
  - job create\
  sqoop job --create sqoopjob -- import --connect jdbc:mysql://localhost/neeldb --username root --password hadoop@123 --query "select * from hrtable where country = 'Iran' AND \$CONDITIONS" -m 1 --target-dir '/Iran_part2/'

  
## Hive
  hive is used to convert all the semi structured data into structed data
  - we can create 3 different types of table in hive 
    - managed table
    - external table
    - temp table
  
  ** whenever we load data from HDFS to HIVE, it will permanantly move the data from HDFS storage to HIVE storage bcz at the end both have same storage. so to have a duplicate of same file is not efficent, that's why hadoop move the file from hdfs to hive permanantly 
  
#### Notes
  - Hive tool is used for running ad hoc queries (similar to sql)
  - Hive uses default location to store files "/user/hive/warehouse" (this is location where all db, tables are stored), (this locatiion can be accessed by other data processing tool example spark sql)
  - beeline is used to open multiple hive instance
  - whereas hive cli (command line interface) allows us to open only one hive instance
  - although to run beeline need hiveserver2 to run multiple hive instances
  - .hql file
  - web editor (HUE, it helps to run query in web) clouder vm

  
  ** Fault tolerance - we have DAG (directed acyclic graph), suppose our code stopped in between somewhere. we can start the execution again and this time we have DAG and we will come to that place where our excution stopped. that's why hive is fault tolerance. ** DAG is just make the flow of execution 
  
  
### Hiverserve2 Architecture
  - Multiple session instance can can be started
  - Thrift service - handles multile job submitting by multiple users

  
 ## partitioning
  - by default partitioning is 100 and it always takes the last column for partitioning that's the demerit of this 
  
## Partioning + Bucketing
  - in partitioning we have fixed number of columns which is last one in the table
  - but in case of bucketing we can sepficy number of colunns for division
  - buckeitng tries to make a uniform data 
  - partitioning is map only job, while bucketing is map reduce job

  
## AVRO TABLE
  - by default avro table cannt handle NULL values
  - to make it work, we have to create another table with taking care of NULL value
  
## PARQUET
  - it reduces the file size without dropping any dataset
  - it fast in access
  
  
# REVISION
  ### HADOOP 
    -  copyFromLocal -> This restricts your copy from file to local (it takes only one source)
    - PUT -> can take files from multiple sources 
  ### SCOOP
    - import
    - export
    - import-all-tables
    - export-all-tables
    - job
    - eval
    - scoop -> import --connect database --username --password --query
    
  * HOW TO CHANGE THE BLOCKSIZE FOR PARTICULAR FILE IN HDFS
    - hdfs dfs -Dfs.blocksize = new block size in bytes
  
  * What is default datawarehouse in hive ?
    - derbyDB
  
  * what is command to bucket the tables ?
    - Clustered by (column name) into 10 buckets
  
  * what are valid hadoop configuration files ?
    - Hadoop-env.sh
    - core-site.xml
    - yarn-site.cml
    - mapred-site.xml
    - hdfs-site.xml
  
  * Distributed cache can be used in REDUCER JOB.
 
  * HDFS command to check inconstatncy
     - hdfs fsck/path to dir /path to blocks
  
  * Checkpoint node download FSImage and editlogs from active namenode, it merge existing fsimage with edit logs and store modified fsimage to
    - into active namenode
  
  * hdfs command to get current status of safe mode of namenode ?
    - hdfs dfsadmin -safemode get
  
  * hdfs allows client to read a file which is already opened for write operations by other client ?
    - False ( write one read many)
  
  * what exactly happens in namenode safemode ? give some statements
    - it is maintenance state of namenode (fsimage + editlogs to fsimages -> moves to backup node)
    - safemode chages cluster into read only mode
  
  * HIVE PARTITIONING VS BUCKETING
    - partitioning is map-only job, bucketing is reducer job
    - partitioning is static as well as dynamic
  
  * in hive you can copy the schema f
  
  
  ## EXPLANATION OF EVERYTHING
  - datanode and name node is are nothigs it the machine which contain them, but to call it mahcine is not good. bcz a machine contain so many things but datanode and namenode are 2 of those things machine store
  - after completion of mapper job the data is temporary store in local file system 
  - mapper job is done in ram
  - datanode and namenode are services running in a machine
  - reducer reads the data from local disk and write the data in hdfs
  - dfs -> distrubuted file system while we use local file system in case of mapper temporary storage
  - there are 2 types of files are generated "partm" , "partr" but we saw only "partr" files which are reducer file. but if we want we can see the "partm" files as well
  - cache memory are of 2 types -> volatile and presistent 
  - 
