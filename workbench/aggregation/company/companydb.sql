DROP DATABASE IF EXISTS company_db;
CREATE DATABASE company_db;
USE company_db;

-- Departments
CREATE TABLE departments
(
	department_id INT PRIMARY KEY,
	department_name VARCHAR(50),
	city VARCHAR(50)
);

INSERT INTO departments (department_id, department_name, city)
	VALUES	(1, "IT", "Stockholm"),
			(2, "Economy", "Gothenburg"),
			(3, "HR", "Malmö");

-- Employees
CREATE TABLE employees
(
	employee_id INT PRIMARY KEY,
	firstname VARCHAR(50),
	lastname VARCHAR(50),
	department_id INT,
    salary DECIMAL(10,2),
	FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

INSERT INTO employees (employee_id, firstname, lastname, department_id, salary)
	VALUES	(1, "Anna", "Svensson", 1, 42000),
			(2, "Johan", "Lind", 1, 38000),
			(3, "Maria", "Berg", 2, 46000),
			(4, "Erik", "Holm", 3, 39000),
			(5, "Lisa", "Ek", 2, 41000);

-- Projects
CREATE TABLE projects
(
	project_id INT PRIMARY KEY,
	project_name VARCHAR(100),
	budget DECIMAL(12,2)
);

INSERT INTO projects (project_id, project_name, budget)
	VALUES	(1, "App Development", 200000),
			(2, "Payroll", 150000),
			(3, "Recruitment", 80000);

-- Employee project
CREATE TABLE employee_project
(
	id INT PRIMARY KEY,
	employee_id INT,
	project_id INT,
	hours INT,
	FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
	FOREIGN KEY (project_id) REFERENCES projects(project_id)
);

INSERT INTO employee_project (id, employee_id, project_id, hours)
	VALUES	(1, 1, 1, 120),
			(2, 1, 2, 80),
			(3, 2, 1, 90),
			(4, 3, 2, 70),
			(5, 2, 3, 60),
			(6, 2, 2, 40);