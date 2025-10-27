SELECT
	students.class, COUNT(*) AS students_in_class
FROM
	students
GROUP BY class
HAVING COUNT(*) >
(
	SELECT
		AVG(class_count)
	FROM
	(
		SELECT
			COUNT(*) AS class_count
		FROM
			students
		GROUP BY class
	) AS class_count
);
