CREATE DATABASE IF NOT EXISTS Employee;
use Employee;

SELECT * FROM hr_employee LIMIT 5;

-- 2.
DESC hr_employee;

-- select  from hr_employee;
-- 3.
SELECT COUNT(*) AS Employee, Department FROM hr_employee GROUP BY Department;

-- select count(gender) from hr_employee;
-- 4.
SELECT count(*), Department, gender FROM hr_employee GROUP BY Department, gender order by department;

-- 5.
SELECT COUNT(*) AS WorkForce, JobRole FROM hr_employee GROUP BY JobRole;

-- 7.
SELECT MAX(Freq_MS) AS Most_Freq_MS FROM (SELECT COUNT(*) AS Freq_MS, MaritalStatus FROM hr_employee GROUP BY MaritalStatus) AS derived_table;

-- 8.
SELECT COUNT(*), JobSatisfaction from hr_employee GROUP BY JobSatisfaction;

-- 9.
SELECT COUNT(*), BusinessTravel from hr_employee where BusinessTravel like '%Frequently%' GROUP BY BusinessTravel;

select count(Attrition) from hr_employee;
SELECT COUNT(Attrition) AS Total_Attrition, SUM(Total_Attrition) AS SUM_Attrition, Department FROM hr_employee where Attrition = 'Yes' GROUP BY Department;