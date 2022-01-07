-- Set up 
-- Create a file named where_exercises.sql. Make sure to use the employees database.
SHOW DATABASES;
USE employees;
SHOW TABLES;

-- 2. Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya' using IN. Enter a comment with the number of records returned.
-- 709
DESCRIBE employees;

SELECT COUNT(*)
FROM employees 
WHERE first_name
IN ('Irena', 'Vidya', 'Maya');

-- 3. Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', as in Q2, but use OR instead of IN. Enter a comment with the number of records returned. Does it match number of rows from Q2?
-- Yes, 709
SELECT *
FROM employees 
WHERE first_name = 'Irena'
OR first_name = 'Vidya' 
OR first_name = 'Maya';

-- 4. Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', using OR, and who is male. Enter a comment with the number of records returned.
-- 441
SELECT *
FROM employees
WHERE gender = 'M'
AND (first_name = 'Irena'
OR first_name = 'Vidya' 
OR first_name = 'Maya');

-- 5. Find all current or previous employees whose last name starts with 'E'. Enter a comment with the number of employees whose last name starts with E.
-- 7330
SELECT *
FROM employees
WHERE last_name 
LIKE 'E%';

-- 6. Find all current or previous employees whose last name starts or ends with 'E'. Enter a comment with the number of employees whose last name starts or ends with E. How many employees have a last name that ends with E, but does not start with E?
-- 30723 employees last names starts or ends with E. 
SELECT *
FROM employees 
WHERE last_name 
LIKE 'E%' 
OR last_name 
LIKE '%E';
-- 23393 employees end with E but not start with E
SELECT *
FROM employees 
WHERE last_name 
LIKE '%E'
AND last_name NOT LIKE 'E%';

-- 7. Find all current or previous employees employees whose last name starts and ends with 'E'. Enter a comment with the number of employees whose last name starts and ends with E. How many employees' last names end with E, regardless of whether they start with E?
-- 899 employees start and end with E.
SELECT *
FROM employees 
WHERE last_name 
LIKE 'E%' 
AND last_name 
LIKE '%E';
-- 24292 employees last named ends with E
SELECT *
FROM employees 
WHERE last_name 
LIKE '%E';

-- 8. Find all current or previous employees hired in the 90s. Enter a comment with the number of employees returned.
-- 135214 employees were hired in the 90s
SELECT *
FROM employees 
WHERE hire_date
BETWEEN '1990-1-1' AND '1999-12-31';

-- 9. Find all current or previous employees born on Christmas. Enter a comment with the number of employees returned.
-- 842 employees were born on Christmas
SELECT * 
FROM employees 
WHERE birth_date 
LIKE '%%%%-12-25';

-- 10. Find all current or previous employees hired in the 90s and born on Christmas. Enter a comment with the number of employees returned.
-- 362 employees where born on christmas and hired in the 90s
SELECT *
FROM employees
WHERE hire_date BETWEEN '1990-1-1' AND '1999-12-31'
AND birth_date LIKE '%%%%-12-25';

-- Find all current or previous employees with a 'q' in their last name. Enter a comment with the number of records returned.
-- 1873 employees with a 'q' in their last name
SELECT *
FROM employees 
WHERE last_name 
LIKE '%q%';

-- Find all current or previous employees with a 'q' in their last name but not 'qu'. How many employees are found?
-- 547 employees had 'q' but not 'qu' in their names.
SELECT *
FROM employees 
WHERE last_name 
LIKE '%q%' 
AND last_name NOT LIKE '%qu%';