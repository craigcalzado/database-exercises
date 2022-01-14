-- SETUP 
SHOW DATABASES;
USE employees;

-- 1. Write a query that returns all employees, their department number, their start date, their end date, and a new column 'is_current_employee' that is a 1 if the employee is still with the company and 0 if not.

SELECT e.emp_no Employee, 
	 de.dept_no Deparment_Number,
	e.hire_date Start_Date,
	de.to_date End_date,
	de.to_date > NOW() Is_Current_Employee
FROM dept_emp de
	JOIN employees e
	USING (emp_no);
-- Write a query that returns all employee names (previous and current), and a new column 'alpha_group' that returns 'A-H', 'I-Q', or 'R-Z' depending on the first letter of their last name.

SELECT CONCAT(last_name,', ',SUBSTR(first_name,1,1)) Last_Name,
	CASE 
	WHEN SUBSTR(last_name,1,1) BETWEEN 'a' AND 'h' THEN 'A-H'
	WHEN SUBSTR(last_name,1,1) BETWEEN 'i' AND 'q' THEN 'I-Q'
	WHEN SUBSTR(last_name,1,1) BETWEEN 'r' AND 'z' THEN 'R-Z'
	ELSE "N/A"
	END AS Alpha_Group
FROM employees;

-- How many employees (current or previous) were born in each decade?
SELECT birth_date
FROM employees;
SELECT MAX(birth_date)
FROM employees;
SELECT MIN(birth_date)
FROM employees;


SELECT COUNT(birth_date) AS Initial_Total,
	COUNT(CASE WHEN SUBSTR(birth_date,3,1) = 5 THEN birth_date ELSE NULL END) AS '1950\'s',
	COUNT(CASE WHEN SUBSTR(birth_date,3,1) = 6 THEN birth_date ELSE NULL END) AS '1960\'s',
	
	COUNT(CASE WHEN SUBSTR(birth_date,3,1) = 5 THEN birth_date ELSE NULL END) +
	COUNT(CASE WHEN SUBSTR(birth_date,3,1) = 6 THEN birth_date ELSE NULL END) AS Total_Born
FROM employees;

-- What is the current average salary for each of the following department groups: R&D, Sales & Marketing, Prod & QM, Finance & HR, Customer Service?

SELECT
	CASE 
           WHEN d.dept_name IN ('research', 'development') THEN 'R&D'
           WHEN d.dept_name IN ('sales', 'marketing') THEN 'Sales & Marketing' 
           WHEN d.dept_name IN ('Production', 'Quality Management') THEN 'Prod & QM'
           WHEN d.dept_name IN ('Finance', 'Human Resources') THEN 'Finance & HR'
           ELSE d.dept_name
           END AS Dept_Group,
           AVG(s.salary) AVG_Salary
FROM salaries s
	JOIN dept_emp de
		USING (emp_no)
	JOIN departments d
		USING (dept_no)
WHERE de.to_date > NOW() AND s.to_date > NOW()
GROUP BY dept_group;