CREATE DATABASE IF NOT EXISTS Employee;
use bankingdb;

SELECT * FROM hr_employee LIMIT 5;

-- 1.	Write SQL command to create a database named hremployeeDB and a table named HR_Employee 
-- with columns for EmployeeID, Department, JobRole, Attrition, Gender, Age, MaritalStatus, Education, 
-- EducationField, BusinessTravel, JobInvolvement, JobLevel, JobSatisfaction, Hourlyrate, Income, Salaryhike, 
-- OverTime, Workex, YearsSinceLastPromotion, EmpSatisfaction, TrainingTimesLastYear, WorkLifeBalance, 
-- Performance_Rating, and set EmployeeID as the primary key.

create database hremployeeDB;

create table if not exists HR_Employee (EmployeeID varchar(10) NOT NULL, Department varchar(20), JobRole varchar(20),
Attrition varchar(20), Gender varchar(10), Age int, MaritalStatus varchar(20), Education varchar(20),
Educationfield varchar(20), BusinessTravel varchar(20), JobInvolvment varchar(10), JobLevel varchar(20), 
JobSatisfaction varchar(20), Hourlyrate int, Income int, Salaryhike varchar(20), Performance_Rating varchar(10),
PRIMARY KEY (EmployeeID));

-- 2. Return the shape of the table
DESC hr_employee;


-- 3. Show the count of Employee & percentage Workforce in each Department
SELECT COUNT(*) AS Employee, (count(Department)/max(EmployeeID)*100) as emp_pecentage,  Department FROM 
hr_employee GROUP BY Department;

select count(Department) as dept from hr_employee group by Department;
select max(EmployeeID) from hr_employee;

-- 4.	Which gender have higher strength as workforce in each department?
SELECT count(*), Department, gender FROM hr_employee GROUP BY Department, gender order by department;

-- 5.	Show the workforce in each Job Role
SELECT COUNT(*) AS WorkForce, JobRole FROM hr_employee GROUP BY JobRole;

-- 6.	Show Distribution of Employee's Age Group
select age,count(*) as age_group from hr_employee group by age order by age;

-- 7.	Compare all marital status of employee and find the most frequent marital status.
SELECT MAX(Freq_MS) AS Most_Freq_MS FROM (SELECT COUNT(*) AS Freq_MS, MaritalStatus FROM hr_employee GROUP BY MaritalStatus) AS derived_table;

-- 8.	What is Job satisfaction level of employee?
SELECT COUNT(*), JobSatisfaction from hr_employee GROUP BY JobSatisfaction;

-- 9.	How frequently employee is going on Business Trip.
SELECT COUNT(*), BusinessTravel from hr_employee where BusinessTravel like '%Frequently%' GROUP BY BusinessTravel;

-- 10.	Show the Department with Highest Attrition Rate (Percentage)
-- select count(Attrition) from hr_employee;
-- SELECT COUNT(Attrition) AS Total_Attrition, Department FROM hr_employee where Attrition = 'Yes' GROUP BY Department;

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

-- 12.	Show Distribution of Employee's Promotion, Find the maximum chances of employee getting promoted.

SELECT CASE WHEN YearsSinceLastPromotion >= 2 AND joblevel <=2 THEN 'high chances'
WHEN YearsSinceLastPromotion >= 5 AND joblevel <= 5 THEN 'medium chances' 
ELSE 'low chances'
END AS promotion_chances,
COUNT(*) AS num_employees,
ROUND(COUNT(*)/ (SELECT COUNT(*) FROM hr_employee) * 100,2) AS promotion_rate from hr_employee
GROUP BY promotion_chances ORDER BY num_employees DESC;

-- 13.	Find the Attrition Rate for Marital Status.
SELECT COUNT(Attrition) AS Attrition_Rate, MaritalStatus FROM hr_employee WHERE Attrition = 'Yes' GROUP BY MaritalStatus;

-- 14.	Find the Attrition Count & Percentage for Different Education Levels
select sum(attrition_temp)/count(attrition_temp) as attrition_percentage, count(attrition_temp) as attrition_count, education from
(select education,
case 
	when attrition = 'yes' then 1
    else 0
end as attrition_temp
from hr_employee) as derived_table group by education;

-- 15.	Find the Attrition & Percentage Attrition for Business Travel.
select sum(attrition_temp)/count(attrition_temp) as attrition_percentage, count(attrition_temp) as attrition_count,
 BusinessTravel from
(select BusinessTravel,
case 
	when attrition = 'yes' then 1
    else 0
end as attrition_temp
from hr_employee) as derived_table group by BusinessTravel;

-- 16.	Find the Attrition & Percentage Attrition for Various JobInvolvement
select sum(attrition_temp)/count(attrition_temp) as attrition_percentage, count(attrition_temp) as attrition_count,
 JobInvolvement from
(select JobInvolvement,
case 
	when attrition = 'yes' then 1
    else 0
end as attrition_temp
from hr_employee) as derived_table group by JobInvolvement;

-- 17.	Show Attrition Rate for Different JobSatisfaction.
select count(attrition) as attrition_rate, JobSatisfaction from hr_employee where attrition = 'yes'
 group by JobSatisfaction;
 
-- 18 Find key reasons for attrititon in a company
select 
department ,
JobRole,
MaritalStatus,
Education,
BusinessTravel,
JobInvolvement,
JobSatisfaction
from
(select department,
 (sum(case when attrition = 'Yes' then 1 end)/count(*)*100) as attrition_rate
 from hr_employee 
 group by department
 order by attrition_rate desc
 limit 1) table1,

 (select JobRole,
 (sum(case when attrition = 'Yes' then 1 end)/count(*)*100) as attrition_rate
 from hr_employee 
 group by JobRole
 order by attrition_rate desc
 limit 1) table2,
 
 (select MaritalStatus,
 (sum(case when attrition = 'Yes' then 1 end)/count(*)*100) as attrition_rate
 from hr_employee 
 group by MaritalStatus
 order by attrition_rate desc
limit 1) table3,

 (select Education,
 (sum(case when attrition = 'Yes' then 1 end)/count(*)*100) as attrition_rate
 from hr_employee 
 group by Education
 order by attrition_rate desc
limit 1) table4,

(select BusinessTravel,
 (sum(case when attrition = 'Yes' then 1 end)/count(*)*100) as attrition_rate
 from hr_employee 
 group by BusinessTravel
 order by attrition_rate desc
 limit 1) table5,
 
 (select JobInvolvement,
 (sum(case when attrition = 'Yes' then 1 end)/count(*)*100) as attrition_rate
 from hr_employee 
 group by JobInvolvement
 order by attrition_rate desc
 limit 1) table6,

(select JobSatisfaction,
 (sum(case when attrition = 'Yes' then 1 end)/count(*)*100) as attrition_rate
 from hr_employee 
 group by JobSatisfaction
 order by attrition_rate desc
 limit 1) table7 ;
 
-- 19 Return all employee where WorkEx greater than 10, provided that they travel frequently, 
-- WorkLifeBalance as Good and JobSatisfaction is Very High.
select * from hr_employee where workex>10 and businesstravel="Travel_Frequently" and 
worklifebalance="Good" and jobsatisfaction="Very High";

-- 20 Write query to display who has better WorkLifeBalance , Married, Single or Divorced 
-- provided that Performace_Rating is Outstanding. 
select worklifebalance,maritalstatus,performance_rating,count(*) as res_dis from hr_employee 
where performance_rating="Outstanding" group by worklifebalance,maritalstatus,performance_rating;