SELECT
	firstname, lastname, project_id, hours
FROM
	employees
JOIN
	employee_project
    ON employees.employee_id = employee_project.employee_id
WHERE
	employee_project.hours > 100;