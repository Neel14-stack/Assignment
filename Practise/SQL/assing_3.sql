use employeedb;
-- drop table emp_trainee;

select * from olympic limit 5;
select count(*) from olympic;
DESC olympic;

-- Find Number of Teams participating in Summer, Winter Olympics
select count(team) as team_participating, season from olympic group by season;

-- 7.	Display All Sports Played in Olympics Games
select distinct sport from olympic;

-- 8.	Show Number of Athlete Over Years For 'Summer' Olympics
select count(name) as number_athelete, year, season from olympic where season = 'summer' group by year order by year;

-- 9.	Show Number of Events In each Year For 'Summer' and 'Winter' Olympics
select count(event) as number_events, event, year, season from olympic group by year, season, event order by year;

-- 10.	Show Number of Athlete for Each Sport with Most Number of Participation
select count(name) as num, sport from olympic group by sport order by num desc limit 1;

-- 11.	Top 10 Oldest Athlete to ever Participated in Olympics
select distinct(name), age, sport, event, games, medal, year from olympic where age <> 'NA' 
order by age desc limit 10;

-- 12.	Top 10 Heaviest Athlete by Weight To ever Participate in Olympics Games
select distinct(name), weight, sport, event, games, medal, year from olympic where weight <> 'NA'
 order by weight desc limit 10;

