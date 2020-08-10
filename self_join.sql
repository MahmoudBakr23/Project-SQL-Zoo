SELECT COUNT(*) 
FROM stops;

SELECT id 
FROM stops 
WHERE name = 'Craiglockhart';

SELECT id,name 
FROM stops JOIN route ON stops.id=route.stop 
WHERE num = 4 AND company = 'LRT' 
ORDER BY pos;

SELECT company, num, COUNT(*)
FROM route 
WHERE stop=149 OR stop=53
GROUP BY company, num
HAVING COUNT(*)>=2;

SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON(
  a.company=b.company AND a.num=b.num
)
WHERE a.stop=53 AND b.stop = 149;

SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON (
  a.company=b.company AND a.num=b.num
) JOIN stops stopa ON (
  a.stop=stopa.id
) JOIN stops stopb ON (
  b.stop=stopb.id
)
WHERE stopa.name='Craiglockhart' AND stopb.name='London Road';

-- number 7 could not solve

SELECT DISTINCT a.company, a.num
FROM route a JOIN route b ON (
  a.company=b.company AND a.num=b.num
)JOIN stops stopa ON (
  a.stop=stopa.id
)JOIN stops stopb ON (
  b.stop=stopb.id
)
WHERE stopa.name='Craiglockhart' AND stopb.name = 'Tollcross';

SELECT stopb.name,b.company,a.num
FROM route a JOIN route b ON (
  a.company=b.company AND a.num=b.num
) JOIN stops stopa ON (
  a.stop=stopa.id
) JOIN stops stopb ON (
  b.stop=stopb.id
)
WHERE b.company = 'LRT' AND stopa.name='Craiglockhart';

-- number 10 could not solve