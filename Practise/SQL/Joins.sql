CREATE DATABASE IF NOT EXISTS joins;

use joins;

select * from employee;
select * from expense;

alter table expense rename column date to order_date;

-- 1. INNER JOIN (SIMPLE JOIN)
-- Fetch all the orders placed by employees having matching id present in emp table
-- ON is clause : to define realtionship clause between the tables
select * from employee emp join expense exp on (emp.id = exp.id);

select * from employee emp, expense exp where emp.id = exp.id;

-- 2. OUTER JOIN
select emp.id, emp.name, emp.salary, exp.orderid, exp.expanse 
from employee emp JOIN expense exp ON (emp.id = exp.id);

-- 3. LEFT OUTER JOIN (INNER JOIN + LEFT SIDE OF TABLE)
select emp.id, emp.name, emp.salary, exp.orderid, exp.expanse 
from employee emp LEFT OUTER JOIN expense exp ON (emp.id = exp.id);

-- 4. RIGHT OUTER JOIN (INNER JOIN + RIGHT SIDE OF TABLE)
select emp.id, emp.name, emp.salary, exp.orderid, exp.expanse 
from employee emp RIGHT OUTER JOIN expense exp ON (emp.id = exp.id);

-- 5. FULL OUTER JOIN
-- UNION OF LEFT JOIN AND RIGHT JOIN
select emp.id, emp.name, emp.salary, exp.orderid, exp.expanse 
from employee emp LEFT OUTER JOIN expense exp ON (emp.id = exp.id)
UNION
select emp.id, emp.name, emp.salary, exp.orderid, exp.expanse 
from employee emp RIGHT OUTER JOIN expense exp ON (emp.id = exp.id);

