SELECT SUM(population)
FROM world;

SELECT continent 
FROM world x 
WHERE population >= ALL( SELECT population FROM world y 
  WHERE x.continent=y.continent) 
ORDER BY continent;

SELECT SUM (gdp) 
FROM world 
WHERE world.continent = 'Africa';

SELECT COUNT(*) 
FROM world x WHERE area >= 1000000;

SELECT SUM (population) 
FROM world WHERE name IN('Estonia', 'Latvia', 'Lithuania');

SELECT continent, COUNT(name)
FROM world GROUP BY continent;

SELECT continent, COUNT(name) 
FROM world WHERe population >= 10000000 GROUP BY continent;

SELECT continent 
FROM world 
GROUP BY continent HAVING SUM(population) >= 100000000;
