-- UNION AND PARTIONING
-- The union clause is used to combine two seperate select statements and produce the result set as a union of both
-- the select statement.
-- Note: The schema field to be used in both select statements must be in same order, same number and data type

select * from employee;
select * from expense;
select id from employee union select id from expense;

-- select multiple fields from both tables
select id, name from employee union all 
select id,expanse from expense;

-- Partition in MYsql
-- Syntax
 CREATE TABLE table_name PARTITION BY RANGE COLUMNS(column_list) (PARTITION part_name1 VALUES LESS THAN (val_list),
 PARTITION part_name2 VALUES LESS THAN (val_list));
 
 drop table if exists part_employee;
 create table part_employee (empi int, ename varchar(20), age int, address text, salary int)
 partition by range columns (salary)
 (partition p0 values less than (30000),
 partition p1 values less than (50000),
 partition p2 values less than (70000),
 partition p3 values less than (maxvalue));
 
 desc part_employee;
 
 select * from part_employee;
 
 select partition_name, table_rows from information_schema.PARTITIONS 
 WHERE table_schema = 'joins' AND
 table_name = 'part_employee';
 
 -- Drop a specific partition from table
 ALTER TABLE part_employee TRUNCATE PARTITION P2;

-- PARTITION BY LIST
-- PRODUCT ID (101,102,106)
-- PRODUCT ID (103,105,108)
-- PRODUCT ID (104,107,109)

create table part_products (product_id int, product_name varchar(20), store_name varchar(50), prince int)
partition by list(product_id)
(partition p0 values in (101,102,106),
partition p1 values in (103, 105,108),
partition p2 values in (104, 107,109));

-- Partition by HASH values
-- Partiitoning table is used to distribute according to some predefined number of partitions.
-- Distribute data into table evenly
-- HASH(column) PARTITIONS 4;

-- SYNTAX
-- create table partition_table
-- (schema of table)
-- partition by hash value(column_name)
-- partition 4;