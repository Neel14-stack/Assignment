CREATE DATABASE IF NOT EXISTS bankingdb;

SHOW DATABASES;

USE bankingdb;

CREATE TABLE IF NOT EXISTS banking(age INT, job VARCHAR(20), martial VARCHAR(20), education VARCHAR(20),
	default_value VARCHAR(20), housing VARCHAR(20), loan VARCHAR(20), contact VARCHAR(20), month_contact VARCHAR(20),
    day_of_week VARCHAR(20), duration INT, campaign INT, pdays INT, previous INT, poutcome VARCHAR(20), 
    emp_var_rate DECIMAL(2,1), cons_price_idx DECIMAL(5,3), cons_conf_idx DECIMAL(6,3), euriborn3m DECIMAL(4,3), 
    nr_employed DECIMAL(6,1), y INT);
    
DESC banking;

-- DML
-- SELECT COMMAND
select 1+1;
SELECT now();

-- LIMIT - LIMIT THE NUMBR OF RECORDS
SELECT age, job, martial FROM banking LIMIT 5;

SELECT concat('Wednesday',' movie') as MOVIE;

-- TO ENABLE READ FROM LOCAL DRIVE
SET GLOBAL local_infile = TRUE;

SHOW GLOBAL VARIABLES LIKE 'local_infile';

GRANT FILE on *.* to 'root'@'localhost';

 SELECT * FROM banking;
-- 3. LOAD - IT INSERTS RECORDS INTO TABLE USING CSV FILES
-- LOCAL : IT REPRESENTS DATA LOCATION IS IN LOCAL DISK
LOAD DATA LOCAL INFILE 'D:/banking.csv'
INTO TABLE banking
FIELDS TERMINATED BY ',' -- DELIMITER OF COLUMNS
LINES TERMINATED BY '\n'; -- LINES SEPERATED BY '\n' OR '\R\N'

SELECT * FROM banking LIMIT 5;
SELECT count(*) AS NUM_ROWS FROM banking;

-- 4. DISPLAY NUM OF MISSING ROWS
SELECT count(*) AS 'num(total)', count(y) AS 'num (non-missing)', count(*) - count(y) AS 'num (missing)',
		(count(*) - count(y))*100/ count(*) AS '% MISSING' FROM banking;
        
-- 5. MAX, MIN, AVG OR MEAN
SELECT MIN(age) AS min_age, MAX(age) AS max_age, AVG(age) AS mean_age FROM banking;

SELECT MIN(duration) AS min_duration, MAX(duration) AS max_duration, AVG(duration) AS mean_duration FROM banking;

-- 6. SUM
SELECT SUM(duration)/3600 AS Total_duration_hours FROM banking;

-- 7. STD, VAR
SELECT VARIANCE(duration) AS variance, STD(duration) AS std_duration FROM banking;

SELECT VARIANCE(age) AS age_variance, STD(age) AS std_age FROM banking;

-- 8. WHERE CLAUSE
-- Where clause allows you to specify a search condition for rows returned by a query.
-- Where clause to filter rows based on specified conditions.

SELECT count(*) as positive_customers from banking where y=1;

-- SHOW ONLY NOT NULL VALUES FROM EUCATION
SELECT education, duration from banking where y=1 and education is not null;

-- ORDER BY
-- TO SORT IN THE RESULT SET, YOU ADD ORDER BY CLAUSE TO SELECT STATEMENT
-- ORDER BY ASC, DESC
SELECT age, month_contact, duration from banking where y=1
ORDER BY month_contact;

-- First month is in descending order and then duration in ascending order
SELECT age, month_contact, duration from banking where y=1
ORDER BY month_contact DESC, duration ASC;

-- DISTINCT - USE TO SHOW UNIQUE VALUES FROM EACH COLUMN
-- TO DROP DUPLICATE SET FROM RESULT SET
-- MYSQL evaluated DISTINCT clause after FROM, WHERE AND SELECT AND BEFORE ORDER BY CLAUSE
SELECT DISTINCT(education) as education from banking;

SELECT DISTINCT(martial) as marital_status from banking;

-- LIKE OPERATOR - IS A LOGICAL OPERATOR THAT TESTS WHETHER A STRING 
-- CONTAINS SPECIFIED PATTERN OR NOT 
SELECT COUNT(*) AS success_customer FROM banking WHERE poutcome LIKE 's%';

SELECT COUNT(*) AS edu_6 FROM banking WHERE education LIKE '%6y';

-- Group BY
-- MYSQL evaluates GROUP BY vlause after FROM AND WHERE and BEFORE HAVING, SELECT, DISTINCT, ORDER BY and LIMIT
-- FROM WHERE GROUPBY HAVING SELECT DISTINCT ORDER BY LIMIT