select quartile,round(avg(weight_pounds),2) as avg_weight,avg(apgar_5min), count(quartile) as number_mothers from (
SELECT
    mother_age,weight_pounds, apgar_5min,
    CASE
        WHEN mother_age <= Q1 THEN 'AGE < 23'
        WHEN mother_age > Q1 AND mother_age <= Q2 THEN 'age < 33'
        WHEN mother_age > Q2 AND mother_age <= Q3 THEN 'age < 43'
        WHEN mother_age > Q3 THEN 'age > 43'
    END AS quartile
FROM
    ddump,
    (SELECT 
    @Q1 := MIN(mother_age) + 0.25 * (MAX(mother_age) - MIN(mother_age)) AS Q1,
    @Q2 := MIN(mother_age) + 0.5 * (MAX(mother_age) - MIN(mother_age)) AS Q2,
    @Q3 := MIN(mother_age) + 0.75 * (MAX(mother_age) - MIN(mother_age)) AS Q3
FROM
    ddump) AS quartiles) t group by quartile;
        
        

-- SELECT
--     @Q1 := MIN(mother_age) + 0.25 * (MAX(mother_age) - MIN(mother_age)) AS Q1,
--     @Q2 := MIN(mother_age) + 0.5 * (MAX(mother_age) - MIN(mother_age)) AS Q2,
--     @Q3 := MIN(mother_age) + 0.75 * (MAX(mother_age) - MIN(mother_age)) AS Q3
-- FROM
--     ddump ;