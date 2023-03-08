-- UNION AND PARTIONING
-- The union clause is used to combine two seperate select statements and produce the result set as a union of both
-- the select statement.
-- Note: The schema field to be used in both select statements must be in same order, same number and data type

select * from employee;
select * from expense;
select id from employee union select id from expense;

-- select multiple fields from both tables
select id, name from employee union all 
select id,expanse from expense;