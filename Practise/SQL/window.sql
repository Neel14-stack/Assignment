-- WINDOW FUNCTIONhr_employee

use bankingdb;
select * from hr_employee limit 5;

select max(income) as salary, department from hr_employee group by department;

-- write a query to show employee id, age, jobrole, gender details of employee id, age, jobrole, gender details of
-- employee with department having highest salary
-- OVER()
-- Adding over() after aggregate function it will work as an analytical function 
-- over function is works only after aggregate function
-- over(): used too specify query to create window of records

select hremp.employeeid, hremp.age, hremp.department, hremp.jobrole, max(income) over() from hr_employee as hremp;

select *, max(income) over() from hr_employee;

-- show maximum salry from each job role
select hremp.employeeid, hremp.age, hremp.department, hremp.jobrole, 
max(income) over(partition by jobrole) as max_jobrole_income from hr_employee as hremp;

-- ROWNUMBER()
-- write a query which will show first 3 employee from each jobrole to join the country
select employeeid from hr_employee order by employeeid limit 3;

select hremp.employeeid, hremp.age, hremp.department, hremp.jobrole, row_number() 
over(partition by jobrole order by employeeid) as row_num from hr_employee as hremp;

-- RANK()
-- write a query to show top 3 employee from each department earning highest salary
select * from (select hremp.employeeid, hremp.age, hremp.department, hremp.jobrole, row_number() 
over(partition by jobrole order by employeeid) as row_num from hr_employee as hremp) as t1 where row_num <4;


-- DENSERANK()
select hremp.employeeid, hremp.age, hremp.department, hremp.jobrole, dense_rank() 
over(partition by jobrole order by age desc) as rank_val from hr_employee as hremp;

-- Employee ranked on basis of age and work experience
select hremp.employeeid, hremp.age, hremp.department, hremp.jobrole, hremp.workex, dense_rank() 
over(partition by jobrole order by age desc, workex desc) as rank_val from hr_employee as hremp;

-- lag()
select income from hr_employee where employeeid = 28;
select hremp.employeeid, hremp.department, hremp.jobrole, hremp.gender, hremp.income, hremp.workex, lag(income)
over(partition by jobrole order by employeeid) as previous_income from hr_employee hremp;

select hremp.employeeid, hremp.department, hremp.jobrole, hremp.gender, hremp.income, hremp.workex, lag(income,2,0)
over(partition by jobrole order by employeeid) as previous_income from hr_employee hremp;


