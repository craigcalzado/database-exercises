-- Set up  
SHOW DATABASES;
USE employees;
SHOW TABLES;
-- The querys above show the databases and tables in the employees database so i can have a good understanding of what i am working with.

-- 2. Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?
-- Irena Reutenauer was the first person and Vidya Simmen was the last.
DESCRIBE employees;

SELECT *
FROM employees 
WHERE first_name
IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name ASC;
-- The query above finds all employees with first names 'Irena', 'Vidya', or 'Maya', and orders them by first name.

-- 3. Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name and then last name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?
-- Irena Acton was first and 
SELECT *
FROM employees 
WHERE first_name = 'Irena'
OR first_name = 'Vidya' 
OR first_name = 'Maya'
ORDER BY first_name ASC, last_name ASC;
-- The query above finds all employees with first names 'Irena', 'Vidya', or 'Maya', and orders them by first name and then last name.

-- 4. Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by last name and then first name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?
-- Vidya Alameldin was first and Maya Zyda was last.
SELECT *
FROM employees 
WHERE first_name
IN ('Irena', 'Vidya', 'Maya')
ORDER BY last_name ASC, first_name ASC;
-- The query above finds all employees with first names 'Irena', 'Vidya', or 'Maya', and orders them by last name and then first name.

-- 5. Write a query to to find all employees whose last name starts and ends with 'E'. Sort the results by their employee number. Enter a comment with the number of employees returned, the first employee number and their first and last name, and the last employee number with their first and last name.
-- 899 employees returned, 10021-Ramzi Erde was first and 499648-Tadahiro Erde was last.
SELECT *
FROM employees
WHERE last_name 
LIKE 'E%' AND last_name LIKE '%E'
ORDER BY emp_no ASC;
-- The query above finds all employees whose last name starts and ends with 'E'. It then orders them by employee number.

-- 6. Write a query to to find all employees whose last name starts and ends with 'E'. Sort the results by their hire date, so that the newest employees are listed first. Enter a comment with the number of employees returned, the name of the newest employee, and the name of the oldest employee.
-- 899 employees returned. Teiji Eldridge was the newest and Sergi Erde was the oldest employees
SELECT *
FROM employees
WHERE last_name 
LIKE 'E%' AND last_name LIKE '%E'
ORDER BY hire_date DESC;
-- The query above finds all employees whose last name starts and ends with 'E'. It then orders them by hire date.

-- 7. Find all employees hired in the 90s and born on Christmas. Sort the results so that the oldest employee who was hired last is the first result. Enter a comment with the number of employees returned, the name of the oldest employee who was hired last, and the name of the youngest employee who was hired first.
-- 362 employees returned. Khun Bernini is the oldest hired last and Douadi Pettis is the yougest hired first.
SELECT *
FROM employees
WHERE hire_date BETWEEN '1990-1-1' AND '1999-12-31'
AND birth_date LIKE '%%%%-12-25'
ORDER BY birth_date ASC, hire_date DESC;
-- The query above finds all employees hired in the 90s and born on Christmas. It then orders them by birth date and hire date.
