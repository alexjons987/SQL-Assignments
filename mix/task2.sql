START TRANSACTION;

INSERT INTO students(student_id, name, age, city) VALUES (6, "Martin", "22", "Prague");
INSERT INTO enrollments(enrollment_id, student_id, course_id, grade, semester) VALUES (8, 6, 4, 10.0, "Spring2026");

COMMIT;

SELECT * FROM students;
SELECT * FROM enrollments;
SELECT * FROM courses;
