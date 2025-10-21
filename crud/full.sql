CREATE DATABASE courses;
USE courses;

CREATE TABLE courses
(
	course_id INTEGER AUTO_INCREMENT PRIMARY KEY,
	course_name TEXT,
	lecturer TEXT,
	score INTEGER
);

INSERT INTO courses(course_name, lecturer, score) VALUES ("Mathematics", "Lisa", 100);
INSERT INTO courses(course_name, lecturer, score) VALUES ("English", "Erik", 90);
INSERT INTO courses(course_name, lecturer, score) VALUES ("Sports", "Anna", 50);
INSERT INTO courses(course_name, lecturer, score) VALUES ("Programming", "Johan", 150);

SELECT * FROM courses WHERE course_name LIKE "M%";

SELECT * FROM courses WHERE lecturer LIKE "%a%";

UPDATE courses SET lecturer = "Karin" WHERE course_name = "English";
UPDATE courses SET score = 200 WHERE course_name = "Programming";
UPDATE courses SET score = 100 WHERE lecturer LIKE "%a%";
UPDATE courses SET lecturer = "Erik" WHERE course_name = "English";

DELETE FROM courses WHERE course_name = "Sports";
SELECT * FROM courses WHERE course_name = "Sports";

INSERT INTO courses(course_name, lecturer, score) VALUES ("History", "David", 80);
UPDATE courses SET score = 100 WHERE score < 100;
DELETE FROM courses WHERE lecturer = "Lisa";
SELECT * FROM courses WHERE score = 100;
