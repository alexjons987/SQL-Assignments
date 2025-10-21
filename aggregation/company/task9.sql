SELECT
	departments.department_id,
    departments.department_name,
    AVG(employees.salary) AS average_salary
FROM
	departments
JOIN
	employees
    ON departments.department_id = employees.department_id
GROUP BY departments.department_id;
