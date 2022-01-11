-- SETUP 
SHOW DATABASES;
USE join_example_db;


-- NOTES
SELECT *
FROM users;

SELECT *
FROM roles;

SELECT users.name as user_name, roles.name as role_name
FROM users
JOIN roles ON users.role_id = roles.id;

SELECT users.name AS user_name, roles.name AS role_name
FROM users
LEFT JOIN roles ON users.role_id = roles.id;

-- EXERCISES:
-- Use the join_example_db. Select all the records from both the 
SELECT *
FROM users;

SELECT *
FROM roles; 

-- Use join, left join, and right join to combine results from the users and roles tables as we did in the lesson. Before you run each query, guess the expected number of results.

SELECT 
roles.name AS role_name, 
roles.id AS user_id,
users.name AS user_name,
users.email AS user_email
FROM roles 
JOIN users ON roles.id = users.id;

SELECT * 
FROM users 
JOIN roles ON users.role_id = roles.id;

SELECT *
FROM users
LEFT JOIN roles ON users.role_id = roles.id;

SELECT *
FROM users
RIGHT JOIN roles ON users.role_id = roles.id;

-- Although not explicitly covered in the lesson, aggregate functions like count can be used with join queries. Use count and the appropriate join type to get a list of roles along with the number of users that has the role. Hint: You will also need to use group by in the query.

SELECT roles.name, COUNT(*) AS number_of_users
FROM roles
JOIN users ON users.role_id = roles.id
GROUP BY roles.name;

-- Use the employees database.

SHOW DATABASES;
USE employees;

-- Using the example in the Associative Table Joins section as a guide, write a query that shows each department along with the name of the current manager for that department.

SELECT d.dept_name AS Department,
	CONCAT(e.first_name, ' ', e.last_name) AS Manager
FROM departments AS d
JOIN dept_manager AS de
  ON de.dept_no = d.dept_no
 JOIN employees AS e
 ON de.`emp_no` = e.`emp_no`
  WHERE de.`to_date`> NOW();
  
  -- Find the name of all departments currently managed by women.
  
SELECT d.dept_name AS Department,
	CONCAT(e.first_name, ' ', e.last_name) AS Manager,
	e.gender AS Sex
FROM departments AS d
JOIN dept_manager AS de
 ON de.dept_no = d.dept_no
JOIN employees AS e
  ON e.emp_no = de.emp_no
WHERE de.`to_date`> NOW()
AND e.gender = 'F';

-- Find the current titles of employees currently working in the Customer Service department.
	
SELECT t.title AS Title, 
		COUNT(t.emp_no) AS Count
 FROM titles AS t 
    JOIN employees AS e 
      ON t.emp_no = e.emp_no
    JOIN dept_emp AS de
      ON e.emp_no = de.emp_no
    JOIN departments AS d 
      ON de.dept_no = d.dept_no 
 WHERE t.to_date > NOW()
    AND de.to_date > NOW()
    AND d.dept_name = 'Customer Service'
 GROUP BY Title
 ORDER By Count;


-- Find the current salary of all current managers.

SELECT CONCAT(e.first_name, ' ', e.last_name) AS Manager,
		s.salary AS Salary,
		d.dept_name AS Department
FROM dept_manager AS de
JOIN salaries AS s
ON de.emp_no = s.emp_no
JOIN departments AS d
ON de.dept_no = d.dept_no
JOIN employees AS e
  ON e.emp_no = de.emp_no
WHERE s.to_date > NOW()
AND de.to_date > NOW()
ORDER BY d.dept_name;

-- Find the number of current employees in each department.
DESCRIBE `departments`;
DESCRIBE `dept_emp`;

SELECT d.*, 
	COUNT(de.emp_no) AS Num_Employees
FROM departments AS d
	JOIN dept_emp AS de
		ON d.dept_no = de.dept_no
GROUP BY d.dept_name
ORDER BY dept_no;

-- Which department has the highest average salary? Hint: Use current not historic information.
DESCRIBE `salaries`;

SELECT AVG(s.`salary`) AS Average_Salary,
		d.`dept_name` AS Department
FROM `salaries` AS s
	JOIN `dept_emp` AS de
		ON s.`emp_no` = de.`emp_no`
	JOIN `departments` AS d
		ON de.`dept_no` = d.`dept_no`
WHERE s.`to_date` > NOW()
GROUP BY Department
ORDER BY Average_Salary DESC
LIMIT 1; 


-- Who is the highest paid employee in the Marketing department?
DESCRIBE employees;

SELECT CONCAT(e.first_name, " ",e.last_name) AS Employees,
		MAX(s.`salary`) AS Salary
FROM `employees` AS e
	JOIN `salaries` AS s
		ON e.`emp_no` = s.`emp_no`
	JOIN `dept_emp` AS de
		ON s.`emp_no` = de.`emp_no`
WHERE de.`dept_no` = 'd001'
GROUP BY Employees
ORDER BY Salary DESC
LIMIT 1;

-- Which current department manager has the highest salary?
DESCRIBE `dept_manager`;

SELECT CONCAT(e.first_name, " ",e.last_name) AS Employees, 
		s.`salary` AS Salary,
		d.`dept_name` AS Department
FROM `employees` AS e
	JOIN `salaries` AS s
		ON e.`emp_no` = s.`emp_no`
	JOIN `dept_emp` AS de
		ON s.`emp_no` = de.`emp_no`
	JOIN `departments` AS d
		ON de.`dept_no` = d.`dept_no`
	JOIN `dept_manager` AS dm
		ON e.`emp_no` = dm.`emp_no`
WHERE de.`to_date` > NOW() 
AND dm.`to_date` > NOW()
AND d.`dept_name` = 'Marketing'
ORDER BY Salary DESC
LIMIT 1;

-- Determine the average salary for each department. Use all salary information and round your results.

SELECT d.`dept_name` AS Department,
		ROUND(AVG(s.`salary`)) AS Average_Salary
FROM `departments` AS d
	JOIN `dept_emp` AS de
		ON d.`dept_no` = de.`dept_no`
	JOIN `salaries` AS s
		ON de.`emp_no` = s.`emp_no`
GROUP BY Department;

-- Bonus Find the names of all current employees, their department name, and their current manager's name.


	