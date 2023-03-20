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
