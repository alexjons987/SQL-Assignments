CREATE DATABASE courses;
USE courses;

CREATE TABLE courses
(
	course_id INTEGER AUTO_INCREMENT PRIMARY KEY,
	course_name TEXT,
	lecturer TEXT,
	score INTEGER
);
