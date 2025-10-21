SELECT
	employees.employee_id, firstname, lastname, COUNT(employee_project.project_id) as attending_project_count
FROM
	employees
JOIN
	employee_project
    ON employee_project.employee_id = employees.employee_id
GROUP BY employee_id HAVING COUNT(employee_project.project_id) > 1;