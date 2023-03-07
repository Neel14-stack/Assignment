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