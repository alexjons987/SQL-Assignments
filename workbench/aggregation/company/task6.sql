SELECT
	projects.project_name, SUM(hours) as total_hours
FROM
	projects
JOIN
	employee_project
    ON projects.project_id = employee_project.project_id
GROUP BY projects.project_name;
