--Question 6: Employees in the Sales Department
SELECT emp_no, first_name, last_name
FROM employees
WHERE emp_no IN 
(
	SELECT emp_no
	FROM dept_emp
	WHERE dept_no IN
	(
		SELECT dept_no
		FROM departments
		WHERE dept_name = 'Sales'
	)
);

SELECT de.emp_no, e.first_name, e.last_name, d.dept_name
FROM dept_emp de
LEFT JOIN departments d ON de.dept_no = d.dept_no
LEFT JOIN employees e ON de.emp_no = e.emp_no