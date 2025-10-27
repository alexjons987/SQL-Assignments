DROP VIEW IF EXISTS student_course_view;
CREATE VIEW student_course_view AS
SELECT
	students.name AS scv_student_name, courses.course_name AS scv_course_name, enrollments.grade AS scv_grade
FROM
	students
JOIN
	enrollments
    ON enrollments.student_id = students.student_id
JOIN
	courses
    ON courses.course_id = enrollments.course_id;
    
SELECT * FROM student_course_view;