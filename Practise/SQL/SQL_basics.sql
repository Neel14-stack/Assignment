-- This is comment in Mysql
-- Command to login into mysql shell : mysql -u 'username' -p 

-- 1. SHOW 
show databases;

-- 2. DROP Command
DROP DATABASE IF EXISTS employeedb;

-- 3. CREATE
CREATE DATABASE IF NOT EXISTS employeedb;

-- 4. USE Command
CREATE DATABASE employeedb;
USE employeedb;
SHOW TABLES;

-- 5. CREATE TABLE
DROP TABLE IF EXISTS EMP;
CREATE TABLE IF NOT EXISTS EMP(empid VARCHAR(10), empname VARCHAR(20) NOT NULL, designation VARCHAR(20), department VARCHAR(20), salary int, PRIMARY KEY (empid));
DESCRIBE EMP;

-- 6. INSERT : Insert new alue into existing tables
-- INSERT INTO EMP VALUES()
-- INSERT INTO EMP (column1, column2, coulmn3) VALUES();
INSERT INTO EMP VALUES('10879','NEEL','TRAINEE','DATA INSIGHTS', 15000);
INSERT INTO EMP VALUES('10885','DHARAN','TRAINEE','DATA INSIGHTS',NULL);
INSERT INTO EMP (empid, empname, designation, department, salary) VALUES ('10884','PK','TRAINEE','DATA INSIGHTS',15000);

-- 7. SELECT STATEMENT
SELECT * FROM EMP;

-- 8. CHECK CONSTRAINTS
DROP TABLE employee;
CREATE TABLE IF NOT EXISTS employee(empid VARCHAR(10),
	 empname VARCHAR(20) NOT NULL, designation VARCHAR(20),
     age INT, department VARCHAR(20), salary int, PRIMARY KEY (empid), CHECK(age>21));

DESCRIBE employee;
     
INSERT INTO employee VALUES('10879','NEEL','TRAINEE',22,'DATA INSIGHTS', 15000);
INSERT INTO employee VALUES('10885','DHARAN','TRAINEE',18,'DATA INSIGHTS',NULL);

-- 9. DEFAULT CONSTRAINT
DROP TABLE IF EXISTS emp_trainee;
CREATE TABLE IF NOT EXISTS emp_trainee(empid VARCHAR(10),
	 empname VARCHAR(20) NOT NULL, designation VARCHAR(20) NOT NULL DEFAULT 'Trainee',
     age INT, department VARCHAR(20), salary int, PRIMARY KEY (empid), CHECK(age>21));

INSERT INTO emp_trainee VALUES('10879','NEEL',DEFAULT,22,'DATA INSIGHTS', 15000);

INSERT INTO emp_trainee VALUES('10885','DHARAN','TRAINEE',23,'DATA INSIGHTS',NULL);
INSERT INTO EMP (empid, empname, designation, department, salary) VALUES ('10884','PK','TRAINEE','DATA INSIGHTS',15000);


-- 10. INDEX CONSTRAINT: Used to retrieve data from database
CREATE INDEX DEMOINDEX ON emp_trainee(empname, age, salary);
CREATE INDEX HRDETAILS ON emp_trainee(empid,designation,department, salary);


-- 11. USE INDEXES TO SHOW VALUES
SHOW INDEXES FROM emp_trainee;
SHOW INDEXES FROM emp_trainee WHERE Key_name = 'HRDETAILS';

-- 12. DROP TABLE
-- DROP TABLE FROM CURRENT WORKING DATABASE
DROP TABLE IF EXISTS EMP;
DROP TABLE IF EXISTS neel.emptable;
-- DROP INDEX INDEX_NAME ON TABLE_NAME
DROP INDEX HRDETAILS ON emp_trainee;
SHOW INDEXES FROM emp_trainee;

-- ALTER : IS USED TO UPDATE THE EXISTING TABLE
-- ADDING NEW COLUMNS IN EXISTING TABLE
ALTER TABLE emp_trainee 
ADD COLUMN gender VARCHAR (10),
ADD COLUMN DOJ VARCHAR(20);

-- modifying existing column in the table
ALTER TABLE emp_trainee MODIFY COLUMN DOJ DATE;

DESCRIBE emp_trainee;

DROP DATABASE neeldb;

ALTER TABLE emp_trainee MODIFY COLUMN DOJ VARCHAR(30);
DESCRIBE emp_trainee;

-- RENAME A COLUMN USING ALTER (RENAME COLUMN)
ALTER TABLE emp_trainee RENAME COLUMN DOJ TO dataofjoining;
DESC emp_trainee;

SELECT * FROM emp_trainee;

-- 13. UPDATE: MODIFY EXISTING VALUE WITH NEW VALUE
UPDATE emp_trainee SET
empname = 'Rahul', GENDER = 'NA',dataofjoining = '14th september'
WHERE empid = '10879';

SELECT * FROM emp_trainee;
SELECT empname, gender, dataofjoining FROM emp_trainee;