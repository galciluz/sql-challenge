CREATE TABLE employees (
	emp_id SERIAL PRIMARY KEY,
	emp_title_id TEXT,
	birth_date DATE,
	first_name TEXT,
	last_name TEXT,
	sex TEXT,
	hire_date DATE
);

CREATE TABLE titles (
	emp_title_id SERIAL PRIMARY KEY,
	title_name TEXT
);

CREATE TABLE department (
	dept_id SERIAL PRIMARY KEY,
	dept_name TEXT
);

CREATE TABLE salary (
	emp_id SERIAL PRIMARY KEY,
	salary INT
);

CREATE TABLE dep_manager (
	dept_id SERIAL PRIMARY KEY
	emp_id SERIAL PRIMARY KEY,
);

CREATE TABLE dept_emp (
	dept_id SERIAL PRIMARY KEY
	emp_id SERIAL PRIMARY KEY,
);


