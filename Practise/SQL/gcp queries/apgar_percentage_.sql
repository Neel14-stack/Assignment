select count(*), apgar_5min from ddump where apgar_5min < 11 group by apgar_5min order by apgar_5min desc ;
set @total_baby_Count := (select count(*) from ddump where apgar_5min < 11) ;
select @total_baby_Count;

select count(*), apgar_5min,count(*)/@total_baby_Count baby_percent, avg(weight_pounds) from ddump where apgar_5min < 11 group by apgar_5min order by apgar_5min desc ;

