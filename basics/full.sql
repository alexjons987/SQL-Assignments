CREATE DATABASE school_db;
USE school_db;

CREATE TABLE students
(
	id INTEGER AUTO_INCREMENT PRIMARY KEY,
    name TEXT,
    class TEXT,
    age INTEGER
);

INSERT INTO students(name, class, age) VALUES ("Alexander", "LexiconA", 25);
INSERT INTO students(name, class, age) VALUES ("Bob", "LexiconA", 22);
INSERT INTO students(name, class, age) VALUES ("Charlie", "LexiconB", 35);
INSERT INTO students(name, class, age) VALUES ("David", "LexiconB", 28);
INSERT INTO students(name, class, age) VALUES ("Eggbert", "LexiconC", 20);

SELECT * FROM students;
SELECT name, class FROM students;

SELECT * FROM students WHERE class="LexiconA";
SELECT * FROM students WHERE class="LexiconA" ORDER BY age;

UPDATE students SET age=40 WHERE id=2;

SELECT * FROM students WHERE class="LexiconA" ORDER BY age;
