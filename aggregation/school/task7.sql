SELECT
	course_name, COUNT(*) AS students_attended
FROM
	courses
LEFT JOIN
	grades
    ON grades.course_id = courses.course_id
GROUP BY course_name
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
