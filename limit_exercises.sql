-- SETUP
SHOW DATABASES;
USE employees;
SHOW TABLES;

-- 2. List the first 10 distinct last name sorted in descending order.
SELECT DISTINCT last_name
FROM employees
ORDER BY last_name DESC
LIMIT 10;
-- The query above lists the first 10 distinct last names sorted in descending order.

-- 3. Find all previous or current employees hired in the 90s and born on Christmas. Find the first 5 employees hired in the 90's by sorting by hire date and limiting your results to the first 5 records. Write a comment in your code that lists the five names of the employees returned.
-- Alselm Cappello, Utz Mandell, Bouchung Schreiter, Baocai Kushner, Petter Stroustrup
SELECT *
FROM employees
WHERE hire_date BETWEEN '1990-1-1' AND '1999-12-31'
AND birth_date LIKE '%%%%-12-25'
ORDER BY hire_date ASC
LIMIT 5;
-- The query above finds all previous or current employees hired in the 90s and born on Christmas. It finds the first 5 employees hired in the 90's by sorting by hire date and limiting your results to the first 5 records.

-- 4. Try to think of your results as batches, sets, or pages. The first five results are your first page. The five after that would be your second page, etc. Update the query to find the tenth page of results.
-- LIMIT and OFFSET can be used to create multiple pages of data. What is the relationship between OFFSET (number of results to skip), LIMIT (number of results per page), and the page number?
SELECT *, 'Page 10' AS message
FROM employees
WHERE hire_date BETWEEN '1990-1-1' AND '1999-12-31'
AND birth_date LIKE '%%%%-12-25'
ORDER BY hire_date ASC
LIMIT 5
OFFSET 45;
-- The query above finds the tenth page of results. The relationship between OFFSET (number of results to skip), LIMIT (number of results per page), and the page number is that the page number is the OFFSET divided by the LIMIT.
