SELECT
	 students.student_id, AVG(grade) AS avg_grade
FROM
	students
JOIN
	enrollments
    ON enrollments.student_id = students.student_id
GROUP BY students.student_id ORDER BY avg_grade DESC;
