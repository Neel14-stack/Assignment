-- WINDOW FUNCTIONhr_employee

use bankingdb;
select * from hr_employee limit 5;

select max(income) as salary, department from hr_employee group by department;

-- write a query to show employee id, age, jobrole, gender details of employee id, age, jobrole, gender details of
-- employee with department having highest salary
-- OVER()
-- Adding over() after aggregate function it will work as an analytical function 
-- over(): used too specify query to create window of records

select hremp.employeeid, hremp.age, hremp.department, hremp.jobrole, max(income) over() from hr_employee as hremp;

select *, max(income) over() from hr_employee;

-- show maximum salry from each job role
select hremp.employeeid, hremp.age, hremp.department, hremp.jobrole, 
max(income) over(partition by jobrole) as max_jobrole_income from hr_employee as hremp;

-- ROWNUMBER()
-- write a query which will show first 3 employee from each jobrole to join the country
select employeeid from hr_employee order by employeeid limit 3;
select hremp.employeeid, hremp.age, hremp.department, hremp.jobrole, max(income) over (partition by jobrole) 
as max_jobrole_income from hr_employee as hremp;
