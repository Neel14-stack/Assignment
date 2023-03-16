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

## 5 serives (3 from hdfs and 2 from yarn)
- Name node
- secondary name node
- data node
- resource node
- node manager

![Screenshot 2023-03-16 163653](https://user-images.githubusercontent.com/54886608/225600404-87ecc2cb-fbf7-47e7-b0ac-39d9e8d7c6d8.png)


- Application manager - responsible for accepting the job from job scheduler, then it will be asking the node manager where are the resouces and later it will get allocated container.
- for every single job there is a app master, and when the job is completed it get destoryed
- Application Manager negotiates with node manaer on resources.
- monior the running job status ssend by app master
