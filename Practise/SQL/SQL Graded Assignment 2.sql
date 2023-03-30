
-- a)	Create external table “flights” using Database “airline_delayDB”
create database airline_db;
use airline_db;
select * from flight_clean limit 10;
create table if not exists flight_clean (ID int,	YEAR_d int, MONTH_d int, DAY_d int, DAY_OF_WEEK int,
AIRLINE text, FLIGHT_NUMBER int, TAIL_NUMBER text,ORIGIN_AIRPORT text, DESTINATION_AIRPORT text,	
SCHEDULED_DEPARTURE int, DEPARTURE_TIME double, DEPARTURE_DELAY double,	TAXI_OUT double, WHEELS_OFF double,
SCHEDULED_TIME int,	ELAPSED_TIME double, AIR_TIME double, DISTANCE int,	WHEELS_ON double,	
TAXI_IN double,	SCHEDULED_ARRIVAL int,	ARRIVAL_TIME double, ARRIVAL_DELAY double, DIVERTED int, CANCELLED int
);

-- b)	Describe the table schema & show top 10 rows of Dataset
describe flight_clean;
select * from flight_clean limit 10;

-- c)	Find duplicates rows present in dataset.
SELECT  * FROM flights
 GROUP BY id
 HAVING COUNT(*) >1;

-- d)	Average arrival delay caused by airlines
Select avg(arrival_delay) as avg_delay, airline from flight_clean where arrival_delay <> 99999 group by airline;

-- e)	Days of months with respected to average of arrival delays
Select avg(arrival_delay) as avg_delay, day from flight_clean where arrival_delay <> 99999 group by day order by day;

-- g)	Arrange Days of month as per cancellations done in Descending
Select sum(cancelled) as cancellations, day from flight_clean group by day order by cancellations desc;

-- h)	Finding busiest airports with respect to day of week
select count(origin_airport) + count(destination_airport), origin_airport, day_of_week from flight_clean group by origin_airport,destination_airport, day_of_week;

-- select origin_count, destination_count from (
select count(origin_airport) as origin_count, origin_airport from flight_clean group by origin_airport;
-- join
select count(destination_airport) as destination_count, destination_airport from flight_clean 
where destination_airport = 'CVG' group by destination_airport;

select * from 
(select distinct t1.day_of_week,t2.origin_airport,t1.ct_dst,t2.ct_org,(t1.ct_dst+t2.ct_org) as total, rank() over(partition by t1.day_of_week order by (t1.ct_dst+t2.ct_org) desc) as rankVa
from (select day_of_week,destination_airport,count(destination_airport) as ct_dst from flight_clean group by day_of_week,destination_airport) as t1
join (select day_of_week,origin_airport,count(origin_airport) as ct_org from flight_clean group by day_of_week,origin_airport) as t2 
	on t2.origin_airport = t1.destination_airport 
order by total desc) t having rankVa <2 order by DAY_OF_WEEK; 

-- i)	Finding airlines that make the maximum number of cancellations
Select sum(cancelled) as number_cancellation, airline from flight_clean group by airline order by number_cancellation desc;

-- j)	Find and order airlines in descending that make the most number of diversions
Select sum(diverted) as number_diversion, airline from flight_clean group by airline order by number_diversion desc;

-- k)	Finding days of month that see the most number of diversion
Select sum(diverted) as number_diversion, day from flight_clean group by day order by number_diversion desc;

-- l)	Calculating mean and standard deviation of departure delay for all flights in minutes
Select avg(departure_delay), stddev(departure_delay), airline from flight_clean where departure_delay <> 99999  group by airline;

-- m)	Calculating mean and standard deviation of arrival delay for all flights in minutes
Select avg(arrival_delay), stddev(arrival_delay), airline from flight_clean where arrival_delay <> 99999 
group by airline;

-- o)	Create a partitioning table “flights_partition” using suitable partitioned by schema.
drop table part_by_month;
create table part_by_week(id int, year int, month int, day int, day_of_week int, airline text, flight_number int,
tail_number text, origin_airport text, destination_aiport text, scheduled_departure int, departure_time double,
departure_delay double, taxi_out double, wheels_off double, scheduled_time int, elapsed_time double, air_time double,
distance int, wheels_on double, taxi_in double, scheduled_arrival int, arrival_time double, arrival_delay double,
diverted int, cancelled int)
partition by range columns (day)
(partition p0 values less than (8),
partition p1 values less than (15),
partition p2 values less than (22),
partition p3 values less than (28),
partition p4 values less than (maxvalue));

 desc part_by_week;
 
 select * from part_by_week;
 
 select partition_name, table_rows from information_schema.PARTITIONS 
 WHERE table_schema = 'airline_db' AND
 table_name = 'part_by_week';
 
 -- p)	Finding all diverted Route from a source to destination Airport & which route is the most diverted
 select origin_airport, destination_airport, diverted from flight_clean where diverted = 1;
 
 -- q)	Write a query to show Top 3 airlines from each airport making most Delays.(Use Dense Rank/ Rank)
 select sum(departure_delay) + sum(arrival_delay), airline, origin_airport from flight_clean
 where arrival_delay <> 99999 and departure_delay <> 99999 group by origin_airport,airline;
 
 -- r)	Write a query to show Top 10 airlines from each week making most Delays. Find its Ranking.
 select sum(departure_delay + arrival_delay) as delay, airline, day_of_week, rank() over(partition by day_of_week)
 from flight_clean where arrival_delay <> 99999 and departure_delay <> 99999 group by day_of_week, airline order by delay;
 
 -- s)	Create a materialized view for client to show Top 10 airlines with highest Delay.
 create view materialized_view_top10_airline_with_highest_delay 
as 
select airline,departure_delay from flight_clean where DEPARTURE_DELAY > 0 and DEPARTURE_DELAY <> 99999 order by DEPARTURE_DELAY desc limit 10;
select * from materialized_view_top10_airline_with_highest_delay;

-- t)	Create a new column named ‘Delay_Comaprison’ showing if flights making higher or lower than average flight delay.
set SQL_SAFE_UPDATES = 0;

alter table flight_clean add column delayComparison varchar(20);

select @avdelay := (select avg(departure_delay) from flight_clean where DEPARTURE_DELAY > 0 and DEPARTURE_DELAY <> 99999);

update flight_clean set delayComparison = 
	case
	when departure_delay < @avdelay then "Lower"
    when departure_delay > @avdelay then "Upper"
    else "On Time"
end;

select flight_number,delayComparison from flight_clean;

-- u
SELECT
    airline,
    COUNT(*) AS total_flights,
    SUM(CASE WHEN arrival_delay > 30 THEN 1 ELSE 0 END) AS delayed_flights,
    SUM(CASE WHEN arrival_delay > 30 AND day_of_week NOT IN (1,7) THEN 1 ELSE 0 END) AS delayed_not_weekend_flights,
    100 * SUM(CASE WHEN arrival_delay > 30 AND day_of_week NOT IN (1,7) THEN 1 ELSE 0 END) / NULLIF(COUNT(CASE WHEN day_of_week NOT IN (1,7) THEN 1 END), 0) AS percentage_delayed_not_weekend_flights
FROM flight_clean
WHERE airline NOT IN ('AK', 'HI', 'PR', 'VI') and
ARRIVAL_DELAY!=99999 and ARRIVAL_DELAY>0
GROUP BY airline
HAVING COUNT(*) > 10
ORDER BY percentage_delayed_not_weekend_flights DESC;
 
 -- v
 SELECT
    airline,
    COUNT(*) AS total_flights,
    SUM(CASE WHEN arrival_delay < 30 THEN 1 ELSE 0 END) AS delayed_flights,
    SUM(CASE WHEN arrival_delay < 30 AND day_of_week NOT IN (1,7) THEN 1 ELSE 0 END) AS delayed_not_weekend_flights,
    100 * SUM(CASE WHEN arrival_delay > 30 AND day_of_week NOT IN (1,7) THEN 1 ELSE 0 END) / NULLIF(COUNT(CASE WHEN day_of_week NOT IN (1,7) THEN 1 END), 0) AS percentage_delayed_not_weekend_flights
FROM flight_clean
WHERE airline NOT IN ('AK', 'HI', 'PR', 'VI') and
ARRIVAL_DELAY!=99999 and ARRIVAL_DELAY>0
GROUP BY airline
HAVING COUNT(*) > 10
ORDER BY percentage_delayed_not_weekend_flights DESC;

-- w
SELECT day_of_week, month, year, MIN(arrival_delay + departure_delay) AS min_delay
FROM flight_clean
where DEPARTURE_DELAY<>99999 and ARRIVAL_DELAY<>99999 and DEPARTURE_DELAY>0 and ARRIVAL_DELAY>0
GROUP BY day_of_week, month, year;

-- x
SELECT departure_delay, COUNT(*) AS delay_occured, AVG(ELAPSED_TIME) AS avg_elasped,
sum(diverted) as div_flight, avg(taxi_in) as taxi_in, avg(arrival_delay) as arrvial_delay
FROM flight_clean WHERE DEPARTURE_DELAY>0 and DEPARTURE_DELAY <> 99999 and arrival_delay <> 99999 and arrival_delay > 0
GROUP BY departure_delay ORDER BY delay_occured DESC LIMIT 10;     

-- y)	Create a stored procedure to find weeks with maximum flights delays count.
DELIMITER //
CREATE PROCEDURE FindWeeksWithMaxDelayCount()
BEGIN
  SELECT day_of_week, COUNT(*) as DelayCount
  FROM flight_clean
  WHERE arrival_delay > 0 AND departure_delay > 0 AND totalDelay = arrival_delay + departure_delay
  GROUP BY day_of_week
  HAVING COUNT(*) = (SELECT TOP 1 COUNT(*) FROM flights_delay_claeaned
  WHERE arrival_delay > 0 AND departure_delay > 0 AND totalDelay = arrival_delay + departure_delay GROUP BY day_of_week ORDER BY COUNT(*) DESC)
END
DELIMITER ;
 
 