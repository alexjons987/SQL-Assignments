SELECT
	enrollments.enrollment_id, students.name, enrollments.grade
FROM
	students
LEFT JOIN
	enrollments
    ON enrollments.student_id = students.student_id
WHERE
	enrollments.course_id = 2 AND grade > (
		SELECT AVG(grade) FROM enrollments WHERE enrollments.course_id = 2
	);
