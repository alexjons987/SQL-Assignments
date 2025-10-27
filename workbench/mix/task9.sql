SELECT
	 courses.course_name, teachers.name, AVG(enrollments.grade) AS avg_grade
FROM
	courses
JOIN
	course_teachers
    ON course_teachers.course_id = courses.course_id
JOIN
	teachers
    ON teachers.teacher_id = course_teachers.teacher_id
JOIN
	enrollments
    ON enrollments.course_id = courses.course_id
GROUP BY courses.course_name, teachers.name HAVING avg_grade > 8;
