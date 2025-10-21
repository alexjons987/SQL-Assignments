DROP DATABASE IF EXISTS school_db;
CREATE DATABASE school_db;
USE school_db;

CREATE TABLE students
(
	student_id INTEGER AUTO_INCREMENT PRIMARY KEY,
    student_name TEXT,
    class TEXT,
    age INTEGER
);

CREATE TABLE courses
(
	course_id INTEGER AUTO_INCREMENT PRIMARY KEY,
    course_name TEXT,
    teacher TEXT,
    points INTEGER
);

CREATE TABLE grades
(
	grade_id INTEGER AUTO_INCREMENT PRIMARY KEY,
    student_id INTEGER,
    course_id INTEGER,
	grade VARCHAR(1),
    FOREIGN KEY (student_id) REFERENCES students(student_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (course_id) REFERENCES courses(course_id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO students (student_name, class, age)
	VALUES ("Alice", "AA", 19),
		   ("Bob", "AA", 27),
		   ("Charlie", "BB", 22),
		   ("Dede", "BB", 30),
		   ("Erik", "CC", 24),
		   ("Fredrik", "CC", 20),
		   ("Gilbert", "CC", 20);
    
INSERT INTO courses (course_name, teacher, points)
	VALUES ("Introduction to Programming", "Grace", 100),
		   ("Data Structures & Algorithms", "Henry", 200),
		   ("Database Systems", "Isabelle", 150),
		   ("Computer Networks", "Jack", 200),
		   ("Software Engineering", "Katherine", 100),
		   ("Social Engineering", "Katherine", 125);
           
INSERT INTO grades (student_id, course_id, grade)
	VALUES (1, 6, "A"),
		   (2, 5, "B"),
		   (3, 4, "C"),
		   (4, 3, "D"),
		   (5, 2, "E"),
		   (6, 1, "A"),
		   (7, 6, "B"),
		   (1, 5, "C"),
		   (2, 4, "D"),
		   (3, 3, "F");
           
SELECT * FROM students;
SELECT * FROM courses;
SELECT * FROM grades;
