use employeedb;
-- drop table emp_trainee;

select * from olympic limit 5;
select count(*) from olympic;
DESC olympic;

select count(team), season from olympic groyb season;

select distinct sports from olympic;

select count(event), years, season from olympic group by years, season;

select count(athelete), years, season from olympic where season = 'summer' group by years;

select count(name) as num, sport from olympic group by sports order by num = asc;
