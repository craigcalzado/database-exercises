-- Set up 
SHOW DATABASES;
USE employees;
SHOW TABLES;

-- 2. Write a query to to find all employees whose last name starts and ends with 'E'. Use concat() to combine their first and last name together as a single column named full_name.
-- Irena Reutenauer was the first person and Vidya Simmen was the last.
DESCRIBE employees;

SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM employees
WHERE last_name 
LIKE 'E%E';
-- The query above finds all employees whose last name starts and ends with 'E'.

-- 3. Convert the names produced in your last query to all uppercase.
SELECT CONCAT(UPPER(first_name), ' ', UPPER(last_name)) AS full_name
FROM employees
WHERE last_name 
LIKE 'E%E';
-- The query above converts the names produced in the last query to all uppercase.

-- 7. Find all employees hired in the 90s and born on Christmas. Use datediff() function to find how many days they have been working at the company (Hint: You will also need to use NOW() or CURDATE()),
SELECT emp_no, 
CONCAT(UPPER(first_name), ' ', UPPER(last_name)) AS full_name, 
DATEDIFF(NOW(), hire_date) AS days_in_company
FROM employees
WHERE hire_date BETWEEN '1990-1-1' AND '1999-12-31'
AND birth_date LIKE '%-12-25';
-- The query above finds all employees hired in the 90s and born on Christmas.

-- 5. Find the smallest and largest current salary from the salaries table.
SELECT MAX(salary), MIN(salary)
FROM salaries;
-- The query above finds the smallest and largest current salary from the salaries table.

-- Use your knowledge of built in SQL functions to generate a username for all of the employees. A username should be all lowercase, and consist of the first character of the employees first name, the first 4 characters of the employees last name, an underscore, the month the employee was born, and the last two digits of the year that they were born. Below is an example of what the first 10 rows will look like:

SELECT LOWER(CONCAT(SUBSTR(first_name,1,1), SUBSTR(last_name,1,4),'_', SUBSTR(birth_date,6,2), SUBSTR(birth_date,3,2)))
AS username, first_name, last_name, birth_date
FROM employees
LIMIT 10;
-- The query above generates a username for all of the employees.