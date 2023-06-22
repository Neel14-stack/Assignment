use world;
select year, count(*) as Number_of_Babys, round(avg(weight_pounds)*0.453592,2)
 as avg_weight_kg from ddump group by year order by year desc;
