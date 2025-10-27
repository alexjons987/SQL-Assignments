SELECT
	employees.employee_id, firstname, lastname, SUM(hours)
FROM
	employees
JOIN
	employee_project
    ON employee_project.employee_id = employees.employee_id
GROUP BY employees.employee_id ORDER BY SUM(hours) DESC;

SELECT * FROM employees;
SELECT * FROM employee_project;
