SELECT name 
FROM teacher 
WHERE dept IS NULL;

SELECT teacher.name, dept.name
FROM teacher INNER JOIN dept ON (teacher.dept=dept.id);

SELECT teacher.name, dept.name
FROM teacher LEFT JOIN dept ON (teacher.dept=dept.id);

SELECT teacher.name, dept.name
FROM dept  LEFT JOIN teacher ON (teacher.dept=dept.id);

SELECT name,COALESCE(mobile,'07986 444 2266') 
FROM teacher;

SELECT t.name, COALESCE(d.name,'None')
FROM teacher t LEFT JOIN dept d ON t.dept = d.id;

SELECT COUNT(name),COUNT(mobile) 
FROM teacher;

SELECT dept.name,COUNT(teacher.name) 
FROM teacher RIGHT JOIN dept ON teacher.dept = dept.id
GROUP BY dept.name;

SELECT name,
  CASE 
  WHEN dept = 1 OR dept = 2 THEN 'Sci' 
  ELSE 'Art' 
  END
FROM teacher;

SELECT name,
  CASE 
  WHEN dept = 1 OR dept = 2 THEN 'Sci' 
  WHEN dept = 3 THEN 'Art'
  ELSE 'None' 
  END
FROM teacher;

