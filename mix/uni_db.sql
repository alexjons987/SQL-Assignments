-- =========================================================
-- Create database
-- =========================================================

DROP DATABASE IF EXISTS uni_db;
CREATE DATABASE uni_db;
USE uni_db;

-- =========================================================
-- Tables (DDL)
-- =========================================================

-- Tables: students
CREATE TABLE students
(
    student_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    age INT,
    city VARCHAR(50)
);

-- Tables: courses
CREATE TABLE courses
(
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50) NOT NULL,
    credits INT
);

-- Tables: teachers
CREATE TABLE teachers
(
    teacher_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    department VARCHAR(50)
);

-- Tables: course_teachers (connection table)
CREATE TABLE course_teachers
(
    course_id INT,
    teacher_id INT,
    FOREIGN KEY (course_id) REFERENCES courses(course_id),
    FOREIGN KEY (teacher_id) REFERENCES teachers(teacher_id)
);

-- Tables: enrollments
CREATE TABLE enrollments
(
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    grade DECIMAL(3,1),
    semester VARCHAR(10),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- =========================================================
-- Example data (INSERT)
-- =========================================================

-- Students
INSERT INTO students (student_id, name, age, city)
    VALUES  (1, 'Ali Ahmed', 22, 'Stockholm'),
            (2, 'Sara Lind', 21, 'Göteborg'),
            (3, 'Jonas Berg', 23, 'Malmö'),
            (4, 'Fatima Noor', 20, 'Uppsala'),
            (5, 'David Eriksson', 24, 'Örebro');

-- Courses
INSERT INTO courses (course_id, course_name, credits)
    VALUES  (1, 'Database Systems', 7),
            (2, 'Web Development', 6),
            (3, 'Data Structures', 5),
            (4, 'Mathematics I', 5);

-- Teacher
INSERT INTO teachers (teacher_id, name, department)
    VALUES  (1, 'Dr. Maria Svensson', 'Computer Science'),
            (2, 'Lars Johansson', 'Mathematics'),
            (3, 'Anna Berglund', 'IT');

-- Course–teacher connections
INSERT INTO course_teachers (course_id, teacher_id)
    VALUES  (1, 1),
            (2, 3),
            (3, 1),
            (4, 2);

-- Registrations (grades)
INSERT INTO enrollments (enrollment_id, student_id, course_id, grade, semester)
    VALUES  (1, 1, 1, 8.5, 'Fall2025'),
            (2, 1, 2, 7.0, 'Fall2025'),
            (3, 2, 1, 9.0, 'Fall2025'),
            (4, 2, 3, 8.0, 'Spring2025'),
            (5, 3, 4, 6.5, 'Spring2025'),
            (6, 4, 1, 7.5, 'Fall2025'),
            (7, 5, 2, 8.0, 'Fall2025');