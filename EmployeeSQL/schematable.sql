--Delete tables if exists
DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salary;
DROP TABLE IF EXISTS department;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS dept_employee;

--Create tables of employee database
CREATE TABLE titles (
	title_id VARCHAR(5) PRIMARY KEY NOT NULL,
	title_name VARCHAR(50) NOT NULL
);

CREATE TABLE employees (
	emp_id SERIAL PRIMARY KEY NOT NULL,
	emp_titleid VARCHAR(5) NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	sex VARCHAR(1) NOT NULL,
	hire_date DATE NOT NULL,
	FOREIGN KEY (emp_titleid) REFERENCES titles(title_id)
);

CREATE TABLE salary (
	emp_id SERIAL PRIMARY KEY,
	salary INTEGER NOT NULL,
	FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);

CREATE TABLE department (
	dept_id VARCHAR(4) PRIMARY KEY NOT NULL,
	dept_name VARCHAR(50) NOT NULL
);

CREATE TABLE dept_manager (
	dept_id VARCHAR(4) NOT NULL,
	emp_id INTEGER NOT NULL,
	FOREIGN KEY (dept_id) REFERENCES department(dept_id),
	FOREIGN KEY (emp_id) REFERENCES employees(emp_id),
	PRIMARY KEY (dept_id, emp_id)
);

CREATE TABLE dept_employee (
	emp_id INTEGER NOT NULL,
	dept_id VARCHAR(4) NOT NULL,
	FOREIGN KEY (emp_id) REFERENCES employees(emp_id),
	FOREIGN KEY (dept_id) REFERENCES department(dept_id),
	PRIMARY KEY (emp_id, dept_id)
);


