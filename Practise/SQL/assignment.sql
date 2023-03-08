drop table tek_employee;
create table if not exists tek_employee (empid varchar(20), empname varchar(20), salary varchar(10),
department_id varchar(20),manager_id varchar(20));
use joins;

insert into tek_employee value('e1','neel','15000','d1','m1');
insert into tek_employee value('e2','kamal','25000','d2','m2');
insert into tek_employee value('e3','uma','30000','d1','m1');
insert into tek_employee value('e4','ulya','18000','d1','m1');
insert into tek_employee value('e5','urahra','12000','d5','m3');


create table if not exists department (deptid varchar(20), deptname varchar(20));

insert into department value('d1','it support');
insert into department value('d2','data insights');
insert into department value('d3','data analysis');
insert into department value('d4','salesforce');

create table if not exists manager (managerid varchar(20), managername varchar(20), deptid varchar(10));

insert into manager value('m1','sukesh','d1');
insert into manager value('m2','rahul','d2');
insert into manager value('m3','naveen','d3');
insert into manager value('m4','saurabh','d4');

drop table project;
create table if not exists project(projectid varchar(20), projectname varchar(20), teamid varchar(20));

insert into project value('p1','chatbot','e1');
insert into project value('p2','ai','m1');
insert into project value('p3','cloud','e2');
insert into project value('p4','blockchain','m2');

-- QUESTIONS
-- to fetch employee name and department name woking on it
select tek.empname, dept.deptname from tek_employee tek join department dept on (tek.department_id = dept.deptid);

-- to fetch all the employee name and department name working on it
select tek.empname, dept.deptname from tek_employee tek left outer join department dept on (tek.department_id = dept.deptid);	

-- to fetch all the department name and employee name working on it
select tek.empname, dept.deptname from tek_employee tek right outer join department dept on 
(tek.department_id = dept.deptid);

-- to fetch all the department name and all the employee name 
select tek.empname, dept.deptname from tek_employee tek left outer join department dept
on (tek.department_id = dept.deptid)	
union
select tek.empname, dept.deptname from tek_employee tek right outer join department dept on 
(tek.department_id = dept.deptid);

-- select tek.empname, pj.projectname from tek_employee tek join project pj on (tek.empid = pj.teamid)
-- union
-- select dept.deptname, mg.managername from manager mg on (mg.

-- Fetch details of all employee, their manager, their department, and the projects they work on.
select tek.empname, mg.managername, dept.deptname, pj.projectname from tek_employee tek left outer join manager mg
 on (tek.manager_id = mg.managerid) left outer join department dept on (tek.department_id = dept.deptid)
 left outer join project pj  on (tek.empid = pj.teamid);

select tek.empname, mg.managername, dept.deptname,pj.projectname from tek_employee tek join manager mg 
on (tek.manager_id = mg.managerid) join project pj on (tek.empid = pj.teamid) join department dept on
(tek.department_id = dept.deptid);
 
 -- fetch details of only employee, their manager, their department and the projects they work on
 
 -- select tek.empname, mg.managername, dept.deptname, pj.projectname from tek_employee tek left outer join 
--  manager mg on (tek.manager_id = mg.manager_id)  join department dept on (tek.department_id = dept.deptid) 
--  join project pj on (tek.empid = pj.teamid)
select tek.empname, mg.managername, dept.deptname, pj.projectname from tek_employee tek left outer join manager mg
 on (tek.manager_id = mg.managerid) left outer join department dept on (tek.department_id = dept.deptid)
join project pj  on (tek.empid = pj.teamid);

select tek.empname, mg.managername, dept.deptname, pj.projectname from tek_employee tek 
join project pj  on (tek.empid = pj.teamid) right outer join manager mg
 on (tek.manager_id = mg.managerid) right outer join department dept on (tek.department_id = dept.deptid)
 union 
select tek.empname, mg.managername, dept.deptname, pj.projectname from tek_employee tek 
join project pj  on (tek.empid = pj.teamid) right outer join manager mg
 on (tek.manager_id = mg.managerid) left outer join department dept on (tek.department_id = dept.deptid);
 
 -- MYSQL CROSS JOIN
 -- Result set will include all rows from both tables, where each row is the combination of the row in the first 
 -- table with the row in the seocnd table
 -- Return cartesian product
 select * from tek_employee; 
 select * from department;
 
 select tek.empname, dept.deptname 
 from tek_employee tek -- 5 
 cross join department dept; -- 4
-- total result would be of 5*4 = 20 entries 

-- write a query to fetch all employee name and their corresponding department name. also make sure to display 
-- the company name and company location corresponding to each employee

create table company(comapanyid int, companyname varchar(50), location varchar(50));
