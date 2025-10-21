INSERT INTO courses(course_name, lecturer, score) VALUES ("History", "David", 80);
UPDATE courses SET score = 100 WHERE score < 100;
DELETE FROM courses WHERE lecturer = "Lisa";
SELECT * FROM courses WHERE score = 100;
