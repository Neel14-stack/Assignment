-- SQL Stored Procedures
	-- procedure is a database object
    -- a stored procedure is a series of declarative sql statements
    -- stored procedure can be stored in the database and can be reused over and over again
    -- parameters can be passed to stored procedure so that stored procedure can act based on parameter values(s).
    -- sql creates an execution plan and stores it in the cache.
    -- types: stored procesdures 
			-- 1 user defined stored procedure : It is created by DB developer, administrators, these stored procedures 
            -- contain one or more sql statements to select, to delete , to update from db tables.
            -- 2 system stored procedure: are created and executed by SQL server for server admin activities.
  
 -- SYNTAX
 
-- CREATE procedure procedure_name()
-- begin

-- 	declare var varchar(20);
-- 	declare var1 float'

-- end;

select * from hr_employee where department = 'sales';

-- create procedure sales_dept_list
-- begin
-- select * from hr_employee where department = 'sales';
-- end;



DELIMITER $$
drop procedure if exists sales_dept_list;
create procedure sales_dept_list()
begin
select * from hr_employee where department = 'sales';
end $$
DELIMITER;

call sales_dept_list;

DELIMITER ##
create procedure RND_dept (dept_id varchar(50), emp_age int)
BEGIN
select * from hr_employee where department = dept_id;
select * from hr_employee where age > emp_age;
END ##

call RND_dept('Research & development',34);

DELIMITER ##
drop procedure if exists sales_dept;
create procedure if not exists sales_dept()
begin
declare dept_id varchar(40);
declare emp_age int;
select * from hr_employee where department = dept_id;
select * from hr_employee where age > emp_age;
end ##










