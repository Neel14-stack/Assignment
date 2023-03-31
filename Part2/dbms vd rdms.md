- database works on normalization while datawarehouse works on de normalization
- metadata -> repository
- informatica is frontend
  - informatica can't read files on his own
  - the files are converted into logical then it can be read only
  - orcale will be there to read all the files from rep
  - informatics need a support of rdbms (oracle)

- schema is a collection of objects stored in a place and active when required.

Q. difference between mysql and oracle, bcz mysql is not good for production . so is oracle good for produciton . like client - server architecture ?

- first designer -> workflow manager -> workflow monitor -> rep monitor

## Informatioca power centre
- "database neutal" - will communicatew with any database
- powerful data transformation covert one application's data to another's format
- metadata and lineage analysis (reports and metadata manager)


** in dataware house we talk in dimenion and facts, while in db it all about tables **
- A decision support system (DSS) is a system—specifically, an interactive information system—built on top of a data warehouse to make it easy to query or pull information from data

## ETL FOR DATA WAREHOUSING
- OPERATIONAL SYSTEM
  - RDBMS -> MAINFRAME -> OTHER
    - Transaction data
    - Optimized for transaction response time
    - current
    - normalized or de normalized data

- DECISION SUPPORT
  - DATA WAREHOUSE
    - Aggregated data
    - Historical data

- What is Data Granularity?
  - Data granularity is a measure of the level of detail in a data structure. In time-series data, for example, the granularity of measurement might be based on intervals of years, months, weeks, days, or hours.
