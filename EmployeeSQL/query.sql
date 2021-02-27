SELECT * FROM titles;
SELECT * FROM employees;
SELECT COUNT(*) FROM employees;
SELECT COUNT(*) FROM salary;
SELECT * FROM department;
SELECT * FROM dept_employee;
SELECT * FROM dept_manager;

-- List of each employee: employee number, last name, first name, sex, and salary
SELECT e.emp_id, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
INNER JOIN salary s
ON (e.emp_id = s.emp_id);

-- show a list for employees who were hired in 1986
SELECT emp_id, first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = '1986';

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT dm.dept_id, dm.dept_name, e.emp_id, e.last_name, e.first_name
FROM employees e
INNER JOIN dept_manager dm
	ON (e.emp_id = dm.emp_id)
	INNER JOIN department d
	ON (dm.dept_id = d.dept_id);

-- Show list the department of each employee with the following information: employee number, last name, first name, and department name
SELECT e.emp_id, e.last_name, e.first_name, d.dept_name
FROM employees e
INNER JOIN dept_employee dm
	ON (e.emp_id = dm.emp_id)
	INNER JOIN department d
	ON (dm.dept_id = d.dept_id);

--Show list of employees whose first name is "Hercules" and last names begin with "B
SELECT emp_id, first_name, last_name
FROM employees 
WHERE first_name = 'Hercules' AND LEFT(last_name,1) = 'B';

--List all employees in the Sales department, including their employee number, last name, first name, and department name
SELECT e.emp_id, e.last_name, e.first_name, d.dept_name
FROM employees e
INNER JOIN dept_employee dm
	ON (e.emp_id = dm.emp_id)
	INNER JOIN department d
	ON (dm.dept_id = d.dept_id)
WHERE d.dept_id = 'd007';

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_id, e.last_name, e.first_name, d.dept_name
FROM employees e
INNER JOIN dept_employee dm
	ON (e.emp_id = dm.emp_id)
	INNER JOIN department d
	ON (dm.dept_id = d.dept_id)
WHERE dm.dept_id = 'd005' OR dm.dept_id = 'd007';

-- descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) as total
FROM employees 
GROUP BY last_name
ORDER BY last_name DESC;

-- Select the employee 499942.
SELECT e.emp_id, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
INNER JOIN salary s
ON (e.emp_id = s.emp_id)
WHERE e.emp_id='499942';
