- database works on normalization while datawarehouse works on de normalization
- metadata -> repository
- informatica is frontend
  - informatica can't read files on his own
  - the files are converted into logical then it can be read only
  - orcale will be there to read all the files from rep
  - informatics need a support of rdbms (oracle)
  - informatica gives error at the end of the excution that's the drawback of informatica

![WhatsApp Image 2023-04-05 at 10 09 00 AM (1)](https://user-images.githubusercontent.com/54886608/229982736-fa11938b-6598-4e39-ad9f-185ea92df457.jpeg)


- schema is a collection of objects stored in a place and active when required.
- FACT TABLE is summerized data stored in a star schema under data mart
- A data mart can consist of one start sechema or multiple start schema
- dimension are descriptive in nature which is a part of star schema 
- fact tbale consist of foreign key
- while dimension table consist of primay key
- first we design dimension table and then fact tbale comes into the picture
- SNOWFLAKE sceme is extension of dimension (we have chlid and parental chain in snowflake)
- snowflake schema leds us to database instead of dataware house
- dont create too many snowflake schema, we have to prevent creating snowflake schema
- dataware house doesn't need uniqueness, database is already there to maintain the uniqueness. so datawware house can contain redudant values

Q. difference between mysql and oracle, bcz mysql is not good for production . so is oracle good for produciton . like client - server architecture ?

- first designer -> workflow manager -> workflow monitor -> rep monitor

## Informatioca power centre
- "database neutal" - will communicatew with any database
- powerful data transformation covert one application's data to another's format
- metadata and lineage analysis (reports and metadata manager)

![WhatsApp Image 2023-04-05 at 10 09 00 AM](https://user-images.githubusercontent.com/54886608/229982785-e7a1cd54-0c84-4ca1-b0a0-7c5870d66a19.jpeg)

![WhatsApp Image 2023-04-05 at 10 08 59 AM (1)](https://user-images.githubusercontent.com/54886608/229982806-91eade7f-759b-4277-bc66-b263738847d9.jpeg)

![WhatsApp Image 2023-04-05 at 10 08 59 AM](https://user-images.githubusercontent.com/54886608/229982819-1bd88995-7304-41ef-97a0-221c662ac2ca.jpeg)


** in dataware house we talk in dimenion table and facts table, while in db it all about tables **
- A decision support system (DSS) is a system—specifically, an interactive information system—built on top of a data warehouse to make it easy to query or pull information from data

## ETL FOR DATA WAREHOUSING
- OPERATIONAL SYSTEM (EXTRACT)
  - RDBMS -> MAINFRAME -> OTHER
    - Transaction data
    - Optimized for transaction response time
    - current
    - normalized or de normalized data

- (TRANSFORM)
  - aGGREGATE DATA
  - cLEANSE DATA
  - CONSOLIDATE DATA
  - APPLY BUSINESS DATA
  - DE NORMALIZE DATA

- DECISION SUPPORT (LOAD)
  - DATA WAREHOUSE
    - Aggregated data
    - Historical data

- What is Data Granularity?
  - Data granularity is a measure of the level of detail in a data structure. In time-series data, for example, the granularity of measurement might be based on intervals of years, months, weeks, days, or hours.

** log files are generated in case of online (client - server architecture) for example while chatting in whatsapp log files are generated, while in case of ms word its not based on client server and its offline so there is no need of log files to create **

### parsed data
- passing -> execution -> fetching
- write a query -> goes for parsing -> then it takes help from metadata -> fetching happend with the help of cursor


## Notes
- see, the thing is that. Informatica cant read files on his own so we have orcale to read files and convert it into informatica readable format and then we do the mapping bewtween soruce and target
- *source qualifier* is native datatype generated by informatica
- session is one to one
- while workflow is one to many, one workflow can have multiple session
- FUNCTIONAL -> TECHNICAL -> BACK TO FUNCTIONAL

### DATABASE VS DATAWARE HOUSE
** data model refers to database, while dimension model is refer dataware house **
- We build the dataware on the basis of INMON AND kIIMBALL theory (IMP)

** CONFIRM DIMENSION
-
- is used to connect 2 fact table from different stat scheman, and there will be n number of confirm dimension (within the a single datamart)
- the confirm dimension is used to connect 2 data mart (in dataware house, to connect 2 different datamart)
- it contain the common attributes between the 2 different star schema (fact table common attribute) for example, we have sales and marketing  start schema and the common attribute between those start schema is product. so while connect these 2 star schema the confirm dimension will contain only the product.

** MOST OF THE TIME KIMBALL THEORY IS USED **

- MAPPING IS NOTHING BUT A SET OF INSTRUCTION BETWEEN SOURCE AND TARGET, AND THAT SET OF INSTRUCTION IS KNOWN AS TRANSFORMATION
- Informatica Transformations are the repository objects which create, modify, or pass the data to the defined target structures like files, tables, or any other target fields required. A transformation is nothing but a set of instructions that define the data flow and load the data into the target. Informatica offers multiple transformations for performing specific functionalities. 

To understand Informatica transformations more precisely, let’s know what mapping is?

A mapping is nothing but a collection of source and target objects that are linked by a set of transformations. Hence the purpose of transformation is to indicate the operations that the integration service will perform on the data during workflow execution.

### EXPRESSION TRANSFORMATION
- it change in the data record by record
- somes rules are 
  - adjust employee salaries
  - concantennate first and last anme
  - convert string to numbers and dates
  - arithmetica - add, subtract, multiply, divide numeric values
  - test conditional statements and pass the results to target tables or other transformation
- we dont touch the column, column is structural based
- we dont use DML commands on source


-  ** we use time dimension grain, to define the grainduality (in project) **
-  ** grainduality is based on redudancy factor **


## homogenous and hetrogenous
- we can make a single source qualifier out of 2 different homogenous soucres, by using simple join
- but we cant make a source qualififer for a homogenous source and a hetrogenous source, bcz the file format is different in both
- so to connect different hetrogenous source we need to perform some action before making source qualifer


** Router transformation is active transformation **
- active transformation row number is changed
- passive transformation there is no change in record(row number)
- meanwhile the number of columns can be changed in target

## ROUTER GROUPS
- Input group (always one) default group capture rows that fail all group conditions
- user defined output groups
  - each group has one condition
  - all group conditions are evaluated for each row
  - one row can pass multiple conditions

- unlinked group outputs are ignored


### LOOKUP TRANSFORMATION
- lookup transformaiton is used to comprasion of the data coming in
- LOOPKUP TABLE -> it can be any of these source qualifier/ table/ files
- lookup table lyi under the loopup tranformation
- ![WhatsApp Image 2023-04-05 at 10 08 58 AM](https://user-images.githubusercontent.com/54886608/229982830-8a611d36-6e2a-47a5-909c-16fccff66f19.jpeg)
- Type1 -> OLTP , Type2 -> Dataware house, Type3 -> ODS (snapshot) [SLOWLY CHANGING DIMENSION]
- LOOPKUP EXPLANATION - suppose we did some operation which result in 1000 record stored in target, the use of lookup is like that. next time when we pass the input into the lookup transformation and then there we have 2 thing the previous target as a lookup source and the input source. we will use lookup there to find the column things between the 2 sources (lookup source and input)
- key column -> homogenouos columns
- common column -> hetrogenous columns
- in join we have only one conditon while in lookup we have multiple conditions to apply

- *** ####TYPES OF LOOKUP ***
- CONNECTED AND UNCONNECTED
- UNCONNECTED LOOKUP - when we dont connect it in mapping, bcz its a burden to our server, it compares every record for example there is 1 million record it will compare every single one of them. so the performance issues.
- Condition lookup -> we call it when we requrired based on "where" condition. for example we are performing some operationg in between mapping and there is a "where" condition, so we will call the lookup based on the "where" conditio


- --> mapping is not reuseable
- --> maplet is reusable