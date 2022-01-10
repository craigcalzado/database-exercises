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

SELECT last_name
FROM employees
WHERE last_name LIKE 'e%e'
GROUP BY last_name;

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
WHERE first_name
IN ('Irena', 'Vidy', 'Maya')
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

