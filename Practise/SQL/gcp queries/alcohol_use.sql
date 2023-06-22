select alcohol_use, apgar_5min, avg(weight_pounds), count(*) from `Babayshark.Natality` 
where apgar_5min <11 AND alcohol_use IS NOT NULL group by  alcohol_use, apgar_5min order by apgar_5min desc;