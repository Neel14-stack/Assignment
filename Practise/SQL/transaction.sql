-- TRANSACTION
-- DATABSE - ORDERS, ORDERDETAILS, CUSTIMERDETAILS, PRODUCTDETAILS

-- NEW SALES WILL BE ADDED TO AS NEW VALUE TO TALBLE ORDERS : QUERY THIS TABLE TO GET SALES ORDER
-- INSERT NEW SALES ORDER INTO ORDERS TABLE
-- GET NEWLY INSERTED SALES ORDER ID
-- AFTER THIS UPDATE THE ORDER DETAILS INTO ORDERDETAILS TABLES WITH SAME ORDERID
-- SELECT DATA FROM BOTH TABLES TO FINALLY COMIT CHANGES- 

-- steps to be followed
-- use the "start transacation" statement the "begin" or "begin work" are te aliases of the "start transaction"
-- insert new data into table
-- to commit the current ransaction and make changes permanent you can use "commit" statement
-- to rollback the current transaction and cancel its changes you can use "rollback" statement
-- to disable enable auto commit mode for current transaction you can use "set autocommit"
-- mysql automatically commit the changes permanently to you db, to diable it set autocommit = 0 

drop table orderdetails;
drop table orders;

create table orders( ordernum int not null, order_date date not null, required_data date not null, shipped_date date 
default null, status varchar(30) not null, comments text, customernum int(11) not null, primary key (ordernum))

engine = InnoDB default charset = latin1;

-- InnoDB is storage engine in mysql8.0 (by default)

describe orders;

insert  into orders(ordernum,order_date,required_data,shipped_date,
`status`,comments,customernum) values
(10100,'2003-01-06','2003-01-13','2003-01-10','Shipped',NULL,363),
(10101,'2003-01-09','2003-01-18','2003-01-11','Shipped','Check on availability.',128),
(10102,'2003-01-10','2003-01-18','2003-01-14','Shipped',NULL,181),
(10103,'2003-01-29','2003-02-07','2003-02-02','Shipped',NULL,121),
(10104,'2003-01-31','2003-02-09','2003-02-01','Shipped',NULL,141),
(10105,'2003-02-11','2003-02-21','2003-02-12','Shipped',NULL,145),
(10106,'2003-02-17','2003-02-24','2003-02-21','Shipped',NULL,278),
(10107,'2003-02-24','2003-03-03','2003-02-26','Shipped','Customer requested to deliver in office address between 9:30 to 18:30
for this shipping',131),
(10108,'2003-03-03','2003-03-12','2003-03-08','Shipped',NULL,385),
(10109,'2003-03-10','2003-03-19','2003-03-11','Shipped','Customer requested for early delivery using Amazon Prime',486);

select * from orders;

create table orderdetails(ordernum int(11) not null, productcode varchar(15) not null, quantityordered int(11) not null,
priceeach decimal(10,2) not null, orderlinenumber smallint(6) not null, primary key (ordernum, productcode), key 
productcode (productcode),
 constraint `orderdetails_1` foreign key (ordernum) references orders(ordernum) )
 engine = InnoDB default charset = latin1;
 
 describe orderdetails;
 
 select * from orderdetails;
 
 insert  into orderdetails (ordernum,productCode,
quantityOrdered,priceEach,orderLineNumber) values
(10100,'S18_1749',30,'136.00',3),
(10100,'S18_2248',50,'55.09',2),
(10100,'S18_4409',22,'75.46',4),
(10101,'S18_2325',25,'108.06',4),
(10101,'S18_2795',26,'167.06',1),
(10101,'S24_1937',45,'32.53',3),
(10102,'S18_1342',39,'95.55',2),
(10102,'S18_1367',41,'43.13',1),
(10104,'S12_3148',34,'131.44',1),
(10104,'S12_4473',41,'111.39',9),
(10105,'S10_4757',50,'127.84',2),
(10105,'S12_1108',41,'205.72',15),
(10106,'S18_1662',36,'134.04',12),
(10106,'S18_2581',34,'81.10',2);

select column_name, constraint_name, referenced_column_name, referenced_table_name 
from information_schema.KEY_COLUMN_USAGE where table_name = 'orderdetails';

set autocommit = 0;

-- 1. start a new transaction
START TRANSACTION;

-- 2. Get the latest order number
SELECT
	@ordernum:= MAX(ordernum)+1
FROM 
	orders;

-- 3. insert a new order for customer
insert into orders(ordernum, order_date, required_data, shipped_date, status, customernum)
values (@ordernum, '2023-03-01','2023-03-05','2023-03-08', 'In process', 1234);

-- 4. insert order line items
insert into orderdetails (ordernum, productcode, quantityordered, priceeach, orderlinenumber)
values (@ordernum, 'S18_1749',30,'136',1),
(@ordernum, 'S18_2248',50,'55.09',2);

-- 5. commit 
COMMIT;

