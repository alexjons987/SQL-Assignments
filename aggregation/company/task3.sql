SELECT
	departments.department_name, COUNT(*) as employee_count
FROM
	departments
JOIN
	employees
    ON employees.department_id = departments.department_id
GROUP BY departments.department_id