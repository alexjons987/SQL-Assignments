SELECT
	scv_student_name, scv_grade
FROM
	student_course_view
ORDER BY scv_grade DESC LIMIT 5;
