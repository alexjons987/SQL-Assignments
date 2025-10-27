-- Average salary is 41 200 SEK
SELECT
	*
FROM
	employees
WHERE
	employees.salary > (SELECT AVG(salary) FROM employees);
    