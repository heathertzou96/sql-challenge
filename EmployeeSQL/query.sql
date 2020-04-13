SELECT * from departments;
SELECT * from dept_emp;
SELECT * from dept_manager;
SELECT * from employees;
SELECT * from salaries;
SELECT * from titles;

--Question 1: Details of Each Employee
SELECT e.emp_no, e.first_name, e.last_name, e.gender, s.salary
FROM employees e
INNER JOIN salaries s ON e.emp_no = s.emp_no;

--Question 2: Employees Who Were Hired in 1986
SELECT *
FROM employees
WHERE hire_date LIKE '1986%';

--Question 3: Manager of Each Department
SELECT dm.dept_no, dm.emp_no, dm.from_date, dm.to_date, d.dept_name, e.first_name, e.last_name
FROM dept_manager dm
LEFT JOIN departments d ON dm.dept_no = d.dept_no
LEFT JOIN employees e ON dm.emp_no = e.emp_no;

--Question 4: Department of Each Employee
SELECT de.emp_no, e.first_name, e.last_name, d.dept_name
FROM dept_emp de
LEFT JOIN employees e ON de.emp_no = e.emp_no
LEFT JOIN departments d ON de.dept_no = d.dept_no;

--Question 5: All Employees Whose First Name is "Hercules" & Last Names Begin with "B"
SELECT *
FROM employees
WHERE first_name = 'Hercules'
	AND last_name LIKE 'B%';
	
--Question 6: Employees in the Sales Department
SELECT de.emp_no, e.first_name, e.last_name, d.dept_name
FROM dept_emp de
LEFT JOIN departments d ON de.dept_no = d.dept_no
LEFT JOIN employees e ON de.emp_no = e.emp_no
WHERE dept_name = 'Sales'

--Question 7: Employees in the Sales and Development Departments
SELECT de.emp_no, e.first_name, e.last_name, d.dept_name
FROM dept_emp de
LEFT JOIN departments d ON de.dept_no = d.dept_no
LEFT JOIN employees e ON de.emp_no = e.emp_no
WHERE dept_name IN ('Sales', 'Development')

--Question 8: Frequency Count of Employee Last Names in Descending Orders
SELECT last_name, COUNT(last_name) AS "Last Name Count"
FROM employees
GROUP BY last_name
ORDER BY "Last Name Count" DESC;

