-- Average course points 145.83
SELECT
	student_name
FROM
	students
LEFT JOIN
	grades
    ON grades.student_id = students.student_id
LEFT JOIN
	courses
    ON grades.course_id = courses.course_id
WHERE
	points > (SELECT AVG(points) FROM courses)
GROUP BY student_name;
