-- SETUP
SHOW DATABASES;
USE employees;
SHOW TABLES;

DESCRIBE titles;

-- In your script, use DISTINCT to find the unique titles in the titles table. How many unique titles have there ever been? Answer that in a comment in your SQL file.
-- ANS: 7
SELECT COUNT(DISTINCT title)
FROM titles;

-- Write a query to to find a list of all unique last names of all employees that start and end with 'E' using GROUP BY.
DESCRIBE employees;

SELECT last_name, first_name
FROM employees
WHERE last_name LIKE 'e%e'
GROUP BY last_name, first_name;

-- Write a query to to find all unique combinations of first and last names of all employees whose last names start and end with 'E'.
SELECT concat(first_name, " ", last_name) AS full_name
FROM employees
WHERE last_name LIKE 'e%e'
GROUP BY full_name;

-- Write a query to find the unique last names with a 'q' but not 'qu'. Include those names in a comment in your sql code.
-- ANS: Chleq, Lindqvist, and Qiwen
SELECT last_name
FROM employees
WHERE last_name LIKE '%q%'
AND last_name NOT LIKE '%qu%'
GROUP BY last_name;

-- Add a COUNT() to your results (the query above) to find the number of employees with the same last name.
SELECT last_name, COUNT(last_name) AS 'no_of_employees'
FROM employees
WHERE last_name LIKE '%q%'
AND last_name NOT LIKE '%qu%'
GROUP BY last_name;

-- Find all all employees with first names 'Irena', 'Vidya', or 'Maya'. Use COUNT(*) and GROUP BY to find the number of employees for each gender with those names.
SELECT COUNT(*) AS 'Irena_Vidya_Maya', gender
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
GROUP BY gender;

-- Using your query that generates a username for all of the employees, generate a count employees for each unique username. Are there any duplicate usernames?
SELECT LOWER(CONCAT(SUBSTR(first_name,1,1), 
					SUBSTR(last_name,1,4),
					'_',
					SUBSTR(birth_date,6,2),
					SUBSTR(birth_date,3,2))) AS username, COUNT(*) AS num_of_dupl
FROM employees
GROUP BY username
HAVING num_of_dupl = 1;

-- BONUS: How many duplicate usernames are there?
SELECT LOWER(CONCAT(SUBSTR(first_name,1,1), 
					SUBSTR(last_name,1,4),
					'_',
					SUBSTR(birth_date,6,2),
					SUBSTR(birth_date,3,2))) AS username, COUNT(*) AS num_of_dupl
FROM employees
GROUP BY username
HAVING num_of_dupl > 1;

-- More practice w/ aggregte functions:
-- Determine the historic average salary for each employee. When you hear, read, or think "for each" with regard to SQL, you'll probably be grouping by that exact column.
DESCRIBE salaries;

SELECT emp_no, AVG(salary) AS avg_salary
FROM salaries
GROUP BY emp_no;

-- Using the dept_emp table, count how many current employees work in each department. The query result should show 9 rows, one for each department and the employee count.
DESCRIBE dept_emp;

SELECT dept_no, COUNT(dept_no) AS emp_n_dept
FROM dept_emp
GROUP BY dept_no;

-- Determine how many different salaries each employee has had. This includes both historic and current.
DESCRIBE salaries;

SELECT emp_no, COUNT(salary) AS num_of_salaries
FROM salaries
GROUP BY emp_no;

-- Find the maximum salary for each employee.
SELECT emp_no, MAX(salary) AS max_salary
FROM salaries
GROUP BY emp_no;

-- Find the minimum salary for each employee.
SELECT emp_no, MIN(salary) AS min_salary
FROM salaries
GROUP BY emp_no;

-- Find the standard deviation of salaries for each employee.
SELECT emp_no, STDDEV(salary) AS std_dev_salary
FROM salaries
GROUP BY emp_no;

-- Now find the max salary for each employee where that max salary is greater than $150,000.
SELECT emp_no, MAX(salary) AS max_salary
FROM salaries
GROUP BY emp_no
HAVING max_salary > 150000;

-- Find the average salary for each employee where that average salary is between $80k and $90k.
SELECT emp_no, AVG(salary) AS avg_salary
FROM salaries
GROUP BY emp_no
HAVING avg_salary BETWEEN 80000 AND 90000;