-- CTE
-- CTE: COMMON TABLE EXPRESSION which is use to construct complex queries into more readble format

-- CONDITION:
	-- MYSQL version > 8.0
-- CTE is just like derieved table, CTE is not stored as an object and last only during execution of a query statement.

-- SYNTAX
	-- with CTE_NAME (COLUMN LIST) AS 
	-- 	  ( WRITE QUERY ) SELECT * FROM CTE_NAME;
    
-- Fetch employee who earn more than average salary of all employees
with average_salary (avg_sal) as (select avg(salary) from employee) select * from employee emp, average_salary av where
emp.salary > av.avg_sal;

with salesdept as (
select empid, empname, manager_id
from tek_employee
where department_id = 'd1')
select empname, manager_id from salesdept
where manager_id = 'm1';

-- Derived Table
-- Derived table is a virtual table returned from select statement. A derived table is similar to temporary table but
-- this is much simpler

-- syntax
-- select column_llist from
-- (select column_list from table_1) derived_table_name
-- where derived_table_name.column > value;

select salary
from (select avg(salary) as avg_sal from tek_employee) avg_derived_table
inner join tek_employee
where salary > avg_derived_table.avg_sal;




