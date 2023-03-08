use bankingdb;
select * from banking limit 5;

-- give the maximum, mean, and minimun age of the targeted customer
-- check the quality of customer by checking average balance, median balance of customer
-- check if age matters in marketing subscription for deposit
-- check if martial status mattered for a subscription to deposit
-- check if age and marital status together mattered for a subscription to deposite scheme

select max(age) as max_age, min(age) as min_age, avg(age) as avg_age from banking where y = 1;

select * from bank limit 5;

-- 2.
select avg(balance) as avg_balance, (min(balance) + max(balance))/2 as median_balance from bank order by balance;

-- 3.
select * from bank limit 5;
ALTER TABLE bank ADD COLUMN age_group varchar(20);

SET SQL_SAFE_UPDATES = 0;

UPDATE bank
SET age_group = if(age<=25,'<25',
if (age>40,'40+','25-40'));

select age_group from bank;
select age_group, count(y) as y_positive from bank where y = 'yes' group by age_group;

-- 4.
select marital, count(y) as y_positive from bank where y = 'yes' group by marital;

-- 5.
select age_group, marital, count(y) as y_positive from bank where y ='yes' group by age_group, marital;

-- 6.
select age_group, sum(campaign) as mattered_campaign from bank group by age_group;