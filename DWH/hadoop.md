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

![WhatsApp Image 2023-03-16 at 12 53 30 PM](https://user-images.githubusercontent.com/54886608/225543763-a017d15a-bc14-4890-b0a9-e2f2c2dcc41a.jpeg)


* Edit logs : Change in FSImage from last snapshot
* FSImage: FSImage is point in time snapshot of HDFS cluster
* Namespaces : One of the content stored in FSImage, HDFS path to datablocks.
