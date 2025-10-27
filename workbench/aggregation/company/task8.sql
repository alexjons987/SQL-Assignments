SELECT
	projects.project_id, projects.project_name, SUM(hours) as total_hours
FROM
	projects
JOIN
	employee_project
    ON employee_project.project_id = projects.project_id
GROUP BY
	projects.project_id
HAVING
	SUM(employee_project.hours) > (SELECT AVG(hours) FROM employee_project);