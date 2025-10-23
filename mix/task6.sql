SELECT
	 student_name, avg_grade
FROM
	(
		SELECT
			students.student_id, students.name AS student_name, AVG(grade) AS avg_grade
		FROM
			students
		JOIN
			enrollments
			ON enrollments.student_id = students.student_id
		GROUP BY students.student_id
    ) AS student_avg_grade
WHERE avg_grade > (SELECT AVG(grade) FROM enrollments);
