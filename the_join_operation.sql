SELECT matchid, player FROM goal 
WHERE teamid = 'GER';

SELECT id,stadium,team1,team2
FROM game WHERE id = 1012;

SELECT player, teamid, stadium, mdate
FROM game JOIN goal ON (id=matchid)
wHERE teamid = 'GER';

SELECT team1, team2, player 
FROM game 
JOIN goal ON (id=matchid) WHERE player LIKE 'Mario%';

SELECT player, teamid, coach, gtime
FROM goal JOIN eteam ON goal.teamid = eteam.id
WHERE gtime <= 10;

SELECT mdate,teamname 
FROM game 
JOIN eteam ON (team1=eteam.id) 
WHERE eteam.coach = 'Fernando Santos';

SELECT player 
FROM goal JOIN game ON goal.matchid=game.id 
WHERE stadium = 'National Stadium, Warsaw';

SELECT DISTINCT player
FROM game JOIN goal ON matchid = id 
WHERE teamid != 'GER' AND (team1 = 'GER' OR team2 = 'GER');

SELECT teamname, COUNT(id)
FROM eteam JOIN goal ON id=teamid
GROUP BY teamname
ORDER BY teamname;

SELECT stadium, COUNT(id)
FROM game JOIN goal ON id=matchid
GROUP BY  stadium;

-- 11, 12 and 13 could not solve
