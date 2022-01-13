-- Sub-queries NOTES and Examples
SHOW DATABASES;
USE employees;
SHOW TABLES;

-- Scalar Sub-queries (Return a single value)
SELECT AVG(salary) --
	FROM salaries --
	WHERE to_date > CURDATE(); --

SELECT emp_no, salary
FROM salaries
WHERE salary > 
   (	
	SELECT AVG(salary) --
	FROM salaries --
	WHERE to_date > CURDATE() --
	)
AND to_date > CURDATE();

-- Arithmetic sub-query
SELECT emp_no, salary
FROM salaries
WHERE salary > 2 * 
	(
	SELECT AVG(salary) --
	FROM salaries --
	WHERE to_date > CURDATE() --
	)
AND to_date > CURDATE();

-- Column Sub-queries (Return a Single Column)
-- Follows this syntax
SELECT column_a, column_b, column_c
FROM table_a
WHERE column_a 
IN (
    SELECT column_a
    FROM table_b
    WHERE column_b = TRUE
	);
-- example of single column return sub query
SELECT first_name, last_name, birth_date
FROM employees
WHERE emp_no 
IN (
    SELECT emp_no
    FROM dept_manager
	)
LIMIT 10;

-- example row sub-queries(return single row)
SELECT first_name, last_name, birth_date
FROM employees
WHERE emp_no = 
   (
    SELECT emp_no
    FROM employees
    WHERE emp_no = 101010
    	);

-- Example of Table Subqueries Return an Entire Table

SELECT g.birth_date, g.emp_no, g.first_name 
FROM 
   (
    SELECT * 
    FROM employees
    WHERE first_name LIKE 'Geor%'
    	) AS g;
-- OR
SELECT g.first_name, g.last_name, salaries.salary
FROM
    (
     SELECT * 
     FROM employees
     WHERE first_name LIKE 'Geor%'
     ) AS g
	JOIN salaries 
		ON g.emp_no = salaries.emp_no
WHERE to_date > CURDATE();







-- EXERCISES!
-- Find all the current employees with the same hire date as employee 101010 using a sub-query.
SELECT *
FROM employees AS e
	JOIN dept_emp AS de
	ON e.emp_no = de.emp_no
WHERE hire_date = 
	(
    SELECT hire_date
    FROM employees
    WHERE emp_no = 101010 
	 )
AND de.to_date > NOW();

-- Find all the titles ever held by all current employees with the first name Aamod.
SELECT DISTINCT title
FROM titles
WHERE emp_no IN
	(
	SELECT emp_no
	FROM employees
	WHERE first_name = 'Aamod'
	)
AND to_date > NOW();
	
-- How many people in the employees table are no longer working for the company? Give the answer in a comment in your code.
-- 59900
SELECT Count(*) AS Ex_Employees
FROM 
	(
	SELECT emp_no, MAX(to_date) AS cur_emp
	FROM dept_emp
	GROUP BY emp_no
	) AS a
WHERE cur_emp < NOW();

-- Find all the current department managers that are female. List their names in a comment in your code.
-- Isamu L., Karsten S., Leon D., Hilary K 
SELECT CONCAT(e.first_name, ' ', e.last_name) AS Full_Name
FROM dept_manager AS dm
	JOIN employees AS e
	ON dm.emp_no = e.emp_no
WHERE dm.emp_no IN
		(
		SELECT emp_no
		FROM employees
		WHERE gender = 'F'
		)
AND dm.to_date > NOW();

-- Find all the employees who currently have a higher salary than the companies overall, historical average salary.
SELECT CONCAT(e.first_name, ' ', e.last_name) AS Full_Name, 
		MAX(s.salary) AS Salary
FROM employees AS e
	JOIN salaries AS s
	ON e.emp_no = s.emp_no
WHERE s.salary >
		(
		SELECT AVG(salary)
		FROM salaries
		)
		AND s.to_date > NOW()
GROUP BY e.emp_no;

-- How many current salaries are within 1 standard deviation of the current highest salary? (Hint: you can use a built in function to calculate the standard deviation.) What percentage of all salaries is this?

-- 83
SELECT COUNT(*) AS One_STD_Max
FROM salaries 
WHERE to_date > NOW() 
AND salary >= 
(
SELECT (MAX(salary) - STDDEV(salary))
FROM salaries
WHERE to_date > NOW()
);
--.0346
SELECT COUNT(*) /
	(
	SELECT COUNT(*)
	FROM salaries 
	WHERE to_date > NOW()
	) * 100
FROM salaries 
WHERE to_date > NOW() 
AND salary >= 
	(
	SELECT (MAX(salary) - STDDEV(salary))
	FROM salaries
	WHERE to_date > NOW()
	);
	
-- Find all the department names that currently have female managers.
SELECT DISTINCT d.dept_name
FROM dept_manager AS dm
 JOIN departments AS d
   ON dm.dept_no = d.dept_no
WHERE dm.emp_no IN
	(
	SELECT emp_no
	FROM employees
	WHERE gender = 'F'
	)
AND dm.to_date > NOW();

-- Find the first and last name of the employee with the highest salary.
SELECT first_name, last_name
FROM employees
WHERE emp_no =
	(
	SELECT MAX(salary)
	FROM salaries
	);
