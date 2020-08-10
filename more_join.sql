SELECT id, title
FROM movie
WHERE yr=1962;

SELECT yr 
FROM movie 
WHERE title = 'Citizen Kane';

SELECT id,title,yr 
FROM movie 
WHERE title LIKE '%Star Trek%' 
ORDER BY yr;

SELECT id  
FROM actor 
WHERE name = 'Glenn Close';

SELECT id 
FROM movie 
WHERE title = 'Casablanca';

SELECT name 
FROM actor JOIN (
  SELECT actorid 
  FROM casting 
  WHERE movieid = (
    SELECT id 
    FROM movie 
    WHERE title = 'Casablanca'))
cast ON actor.id = cast.actorid;

SELECT name 
FROM actor JOIN (
  SELECT actorid 
  FROM casting 
  WHERE movieid = (
    SELECT id 
    FROM movie 
    WHERE title = 'Alien'))
AS cast ON actor.id = cast.actorid;

SELECT title 
FROM casting JOIN movie ON casting.movieid=movie.id JOIN actor ON casting.actorid=actor.id
WHERE name = 'Harrison Ford';

SELECT title 
FROM casting JOIN movie ON casting.movieid=movie.id JOIN actor ON casting.actorid=actor.id
WHERE name = 'Harrison Ford' AND ord != 1;

SELECT title, name 
FROM casting JOIN movie ON casting.movieid=movie.id JOIN actor ON casting.actorid=actor.id
WHERE ord = 1 AND yr = 1962;

SELECT yr,COUNT(title) 
FROM movie JOIN casting ON movie.id=movieid JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2;

SELECT title,name 
FROM casting JOIN movie ON casting.movieid=movie.id JOIN actor ON casting.actorid=actor.id
WHERE movieid IN (
  SELECT movieid 
  FROM casting
  WHERE actorid IN (
    SELECT id FROM actor
    WHERE name='Julie Andrews'))
AND ord = 1;

SELECT name 
FROM casting JOIN movie ON casting.movieid=movie.id JOIN actor ON casting.actorid=actor.id
WHERE ord = 1  
GROUP BY name 
HAVING COUNT(*) >= 15
ORDER BY name;

SELECT title,COUNT(actorid) 
FROM casting JOIN movie ON casting.movieid=movie.id JOIN actor ON casting.actorid=actor.id
WHERE yr = 1978
GROUP BY title
ORDER BY COUNT(*) DESC,title;

SELECT name 
FROM casting JOIN movie ON casting.movieid=movie.id JOIN actor ON casting.actorid=actor.id
WHERE movieid IN (
  SELECT movieid 
  FROM casting JOIN movie ON casting.movieid=movie.id JOIN actor ON casting.actorid=actor.id
  WHERE name = 'Art Garfunkel')
AND name != 'Art Garfunkel';
