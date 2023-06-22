select "gestation_weeks less than 28" as week,avg(apgar_5min),avg(weight_pounds) from ddump where gestation_weeks < 28
union
select "gestation_weeks between 28 - 32",avg(apgar_5min),avg(weight_pounds) from ddump where gestation_weeks >= 28 and gestation_weeks < 32
union
select "gestation_weeks between 32 - 36",avg(apgar_5min), avg(weight_pounds) from ddump where gestation_weeks >=32 and gestation_weeks < 36
union
select "gestation_weeks between 36 - 40",avg(apgar_5min), avg(weight_pounds) from ddump where gestation_weeks >=36 and gestation_weeks < 40
union
select "gestation_weeks greater than 40",avg(apgar_5min), avg(weight_pounds) from ddump where gestation_weeks <= 40;

select avg(apgar_5min), avg(weight_pounds) from ddump where gestation_weeks > 40;