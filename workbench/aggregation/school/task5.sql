SELECT
	teacher, AVG(points)
FROM
	courses
GROUP BY teacher;
