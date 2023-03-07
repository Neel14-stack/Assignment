use bakingdb;
select * from data limit 5;
drop table stocks;

create table if not exists stocks(TradeDate datetime, SPY double, GLD double, AMZN double, GOOG double, KPIT double,
GILD double, MPC double);

-- INSERT DATA into STOCKS
-- LOAD DATA LOCAL INFILE 'C:/Users/neroy/Downloads/data.csv'
-- INTO TABLE stocks
-- fields terminated by ','
-- lines terminated by '\n';

select * from stocks limit 5;

ALTER TABLE stocks MODIFY TradeDate date;

-- SET GLOBAL sql_safe_updates = 0;
-- SER SQL_SAFE_UPDATE = 0;
-- UPDATE stocks SET TradeDate = str_to_date(TradeDate, '%y%m%d');

DESCRIBE stocks;
select * from stocks;

ALTER TABLE stocks DROP COLUMN spytrends;
ALTER TABLE stocks ADD COLUMN spytrends varchar(20);
SET SQL_SAFE_UPDATES = 0;	
UPDATE stocks
SET spytrends = if(spy > 0, 'positive',
if(spy < 0,'negative','zero'));

select spytrends from stocks;

select AVG(AMZN), IF (AMZN >=0, 'UPTREND','DOWNTREND') AS direction FROM stocks GROUP BY direction;

ALTER TABLE stocks DROP COLUMN weekday;

ALTER TABLE stocks ADD COLUMN weekday varchar(20);

-- UPDATE stocks
-- SET weekday = if(weekday(TradeDate) = 0,'monday',
-- if(weekday(TradeDate) = 1,'tuesday',
-- if(weekday(TradeDate) = 2,'wednesday','sunday')));

UPDATE stocks
SET weekday = case
		when weekday(TradeDate) = 0 then 'monday'
        when weekday(TradeDate) = 1 then 'tuesday'
        when weekday(TradeDate) = 2 then 'wednesday'
        when weekday(TradeDate) = 3 then 'thrusday'
        when weekday(TradeDate) = 4 then 'friday'
        when weekday(TradeDate) = 5 then 'saturday'
        when weekday(TradeDate) = 6 then 'sunday'
        END ;

-- alternative method

-- UPDATE stocks
-- SET weekday = case
-- 		when weekday(TradeDate) = 0 then 'monday'
--         when  = 1 then 'tuesday'
--         when  = 2 then 'wednesday'
--         when = 3 then 'thrusday'
--         when  = 4 then 'friday'
--         when  = 5 then 'saturday'
--         when  = 6 then 'sunday'
--         END ;

select * from stocks limit 5;

select *, weekday(TradeDate) as weekday from stocks;
-- CASE WHEN THEN
select *,
	case
		when weekday(TradeDate) = 0 then 'monday'
        when weekday(TradeDate) = 1 then 'tuesday'
        when weekday(TradeDate) = 2 then 'wednesday'
        when weekday(TradeDate) = 3 then 'thrusday'
        when weekday(TradeDate) = 4 then 'friday'
        when weekday(TradeDate) = 5 then 'saturday'
        when weekday(TradeDate) = 6 then 'sunday'
	END AS weekday
		FROM stocks;
        
        
select sum(sum(spy)+sum(gld)+sum(amzn)+sum(goog)+sum(kpit)+sum(gild)+sum(mpc)), weekday as stock_trend from stocks group by weekday;

select concat(spy+gld+amzn+goog+kpit+mpc) as stock_trend from stocks;

ALTER TABLE stocks DROP COLUMN stock_trend;
ALTER TABLE stocks ADD COLUMN stock_trend varchar(20);
UPDATE stocks
SET stock_trend = if(spy+gld+amzn+goog+kpit+mpc >0,'uptrend','downtrend');

select * from stocks limit 5;