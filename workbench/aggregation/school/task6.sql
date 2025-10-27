SELECT
	student_name, COUNT(*) AS student_grade_count
FROM
	students
LEFT JOIN
	grades
    ON grades.student_id = students.student_id
GROUP BY students.student_id
HAVING COUNT(*) >
(
	SELECT
		AVG(grade_count)
	FROM
	(
		SELECT
			COUNT(*) AS grade_count
		FROM
			grades
		GROUP BY grade
	) AS grade_count
);
