INSERT INTO courses(course_name, lecturer, score) VALUES ("Mathematics", "Lisa", 100);
INSERT INTO courses(course_name, lecturer, score) VALUES ("English", "Erik", 90);
INSERT INTO courses(course_name, lecturer, score) VALUES ("Sports", "Anna", 50);
INSERT INTO courses(course_name, lecturer, score) VALUES ("Programming", "Johan", 150);

SELECT * FROM courses WHERE course_name LIKE "M%";

SELECT * FROM courses WHERE lecturer LIKE "%a%";
