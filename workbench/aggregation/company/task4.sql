SELECT
	departments.department_name, AVG(salary) as avg_salary
FROM
	departments
JOIN
	employees
    ON employees.department_id = departments.department_id
GROUP BY
	departments.department_id;