# Aggregation assignments - School
## Task 1 – INNER SELECT + ORDER BY
1. Display the names of all students who are older than the average age in the database.
2. Use an inner SELECT with AVG to calculate the average age, combined with ORDER BY on age.

## Task 2 – INNER SELECT + JOIN
1. Display the names of all students who have courses with more points than the average of all courses' points.
2. Use an inner SELECT with AVG in combination with JOIN between students, grades and courses.

## Task 3 – GROUP BY + AVG
1. Display each class and its average age, sorted from highest to lowest average age.
2. Use GROUP BY on class, AVG on age, and ORDER BY on the result.

## Task 4 – INNER SELECT + GROUP BY
1. Display all classes that have more students than the average of the number of students per class.
2. Use GROUP BY with COUNT and an inner SELECT to calculate the average.

## Task 5 – JOIN + GROUP BY + AVG
1. Display each teacher’s name and the average score for all their courses, sorted by average score.
2. Use JOIN between courses and possibly other tables, GROUP BY on teachers, and ORDER BY.

## Task 6 – INNER SELECT + JOIN + ORDER BY
1. Display the names of all students who have more courses than the average number of courses per student.
2. Use inner SELECT with COUNT and AVG, combined with JOIN and GROUP BY, sorted by number of courses.

## Task 7 – GROUP BY + INNER SELECT
1. Display all courses where the number of registered students is higher than the average number of students per course.
2. Use GROUP BY on course_id, COUNT to count students, and inner SELECT for the average.

## Task 8 – JOIN + AVG + ORDER BY
1. Display the student names and the average score for all their courses (counting points from courses, not grades).
2. Use JOIN between students, grades, and courses, GROUP BY on student name, AVG on points, and ORDER BY.

## Task 9 – INNER SELECT + GROUP BY + HAVING
1. Show classes where the average age is higher than the total average age in the entire school.
2. Use GROUP BY on class, AVG on age, HAVING with inner SELECT, and ORDER BY.

## Task 10 – Multiple JOIN + INNER SELECT + GROUP BY
1. Show names of all teachers whose courses have more than the average of total points awarded.
2. Use JOIN between all three tables, GROUP BY on teachers, SUM on points, and inner SELECT with AVG to compare.