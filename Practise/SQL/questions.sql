CREATE DATABASE IF NOT EXISTS Employee;
use bankingdb;

SELECT * FROM hr_employee LIMIT 5;

-- 2. Return the shape of the table
DESC hr_employee;

-- select  from hr_employee;
-- 3. Show the count of Employee & percentage Workforce in each Department
SELECT COUNT(*) AS Employee, Department FROM hr_employee GROUP BY Department;

-- select count(gender) from hr_employee;
-- 4.	Which gender have higher strength as workforce in each department?
SELECT count(*), Department, gender FROM hr_employee GROUP BY Department, gender order by department;

-- 5.	Show the workforce in each Job Role
SELECT COUNT(*) AS WorkForce, JobRole FROM hr_employee GROUP BY JobRole;

-- 7.	Compare all marital status of employee and find the most frequent marital status.
SELECT MAX(Freq_MS) AS Most_Freq_MS FROM (SELECT COUNT(*) AS Freq_MS, MaritalStatus FROM hr_employee GROUP BY MaritalStatus) AS derived_table;

-- 8.	What is Job satisfaction level of employee?
SELECT COUNT(*), JobSatisfaction from hr_employee GROUP BY JobSatisfaction;

-- 9.	How frequently employee is going on Business Trip.
SELECT COUNT(*), BusinessTravel from hr_employee where BusinessTravel like '%Frequently%' GROUP BY BusinessTravel;

-- 10.	Show the Department with Highest Attrition Rate (Percentage)
select count(Attrition) from hr_employee;
SELECT COUNT(Attrition) AS Total_Attrition, SUM(Total_Attrition) AS SUM_Attrition, Department FROM hr_employee where Attrition = 'Yes' GROUP BY Department;

select department,
case
	when attrition = "Yes" then 1
    else 0
end as attrition01
from hr_employee;

select sum(attrition01)/count(attrition01) as attrition_percentage,Department from (
select department,
case
	when attrition = "Yes" then 1
    else 0
end as attrition01
from hr_employee) as t
group by Department order by attrition_percentage desc limit 1
;

-- 11.	Show the Job Role with Highest Attrition Rate (Percentage)
select sum(attrition01)/count(attrition01) as attrition_percentage,JobRole from (
select JobRole,
case
	when attrition = "Yes" then 1
    else 0
end as attrition01
from hr_employee) as t
group by JobRole; -- order by attrition_percentage desc limit 1


-- 13.	Find the Attrition Rate for Marital Status.
SELECT COUNT(Attrition) AS Attrition_Rate, MaritalStatus FROM hr_employee WHERE Attrition = 'Yes' GROUP BY MaritalStatus;
