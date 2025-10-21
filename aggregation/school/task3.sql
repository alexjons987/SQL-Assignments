SELECT
	students.class, AVG(students.age)
FROM
	students
GROUP BY class;
