-- SETUP
SHOW DATABASES;
USE innis_1654;
SHOW TABLES;

-- 1. Using the example from the lesson, create a temporary table called employees_with_departments that contains first_name, last_name, and dept_name for employees currently with that department. 
CREATE TEMPORARY TABLE employees_with_departments(
	first_name VARCHAR(20), 
	last_name VARCHAR(20),
	dept_name VARCHAR(20));
-- The above query creates a temporary table called employees_with_departments with three columns, first_name, last_name, and dept_name.

-- a. Add a column named full_name to this table. It should be a VARCHAR whose length is the sum of the lengths of the first name and last name columns
ALTER TABLE employees_with_departments ADD full_name VARCHAR(40);
-- b. Update the table so that full name column contains the correct data
UPDATE employees_with_departments 
	SET full_name = CONCAT(first_name, ' ', last_name);
-- c. Remove the first_name and last_name columns from the table.
ALTER TABLE employees_with_departments DROP COLUMN first_name;
ALTER TABLE employees_with_departments DROP COLUMN last_name;
-- d. What is another way you could have ended up with this same table?
CREATE TEMPORARY TABLE employees_with_departments AS
SELECT CONCAT(first_name, ' ', last_name) AS fullname, dept_no
FROM employees.employees
JOIN employees.dept_emp USING(emp_no)
JOIN employees.departments USING(dept_no)
LIMIT 100;

-- Redo Code(This is the code I used to redo the exercise)
DROP TABLE employees_with_departments;
-- Test the Code(This is the code I used to test the exercise)
SELECT * FROM employees_with_departments;

-- 2. Create a temporary table based on the payment table from the sakila database.
-- Write the SQL necessary to transform the amount column such that it is stored as an integer representing the number of cents of the payment. For example, 1.99 should become 199.
USE innis_1654;
CREATE TEMPORARY TABLE sakila_payment AS
SELECT amount
FROM sakila.payment
LIMIT 100;

ALTER TABLE sakila_payment ADD int_amount INTEGER;

UPDATE sakila_payment 
SET int_amount = amount * 100;


-- Rest the Table
DROP TABLE sakila_payment;
-- Test the Code
SELECT * FROM sakila_payment;

--3. Find out how the current average pay in each department compares to the overall current pay for everyone at the company. In order to make the comparison easier, you should use the Z-score for salaries.
 -- In terms of salary, what is the best department right now to work for? The worst?
SHOW DATABASES;
USE employees;

CREATE TEMPORARY TABLE innis_1654.avg_salary_dept AS
SELECT d.dept_name Department,
			AVG(salary) Avg_Salary
FROM departments d
	JOIN dept_emp de USING(dept_no)
	JOIN employees e USING(emp_no)
	JOIN salaries s USING(emp_no)
WHERE s.to_date > NOW()
GROUP BY Department
ORDER BY Avg_Salary DESC;

-- check my table
USE innis_1654;
SELECT * FROM avg_salary_dept;

-- identify the z-scores
USE employees; 

SELECT department, avg_salary,
			(avg_salary - (
			SELECT AVG(salary)
			FROM salaries)
			) / 
			(SELECT stddev(salary)
			FROM salaries) AS z_score
FROM innis_1654.avg_salary_dept;

-- in terms if salary the best department to work for would be Sales. due to them being 1+ z score above the average department salary.
-- The worst place would be Human Resources in terms of salary due to their average salary being below the avgerage department salary.