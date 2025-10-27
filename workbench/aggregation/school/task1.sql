-- Average age is 23.14
SELECT
	student_name, age
FROM
	students
WHERE
	age > (SELECT AVG(age) FROM students)
ORDER BY age;
