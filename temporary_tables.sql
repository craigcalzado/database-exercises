-- SETUP
SHOW DATABASES;
USE innis_1654;
SHOW TABLES;

-- 1. 
CREATE TEMPORARY TABLE employees_with_departments(
	first_name VARCHAR(20), 
	last_name VARCHAR(20),
	dept_name VARCHAR(20));
-- a.
ALTER TABLE employees_with_departments ADD full_name VARCHAR(40);
-- b.
UPDATE employees_with_departments 
	SET full_name = CONCAT(first_name, ' ', last_name);
-- c. 
ALTER TABLE employees_with_departments DROP COLUMN first_name;
ALTER TABLE employees_with_departments DROP COLUMN last_name;
-- d.
CREATE TEMPORARY TABLE employees_with_departments AS
SELECT CONCAT(first_name, ' ', last_name) AS fullname, dept_no
FROM employees.employees
JOIN employees.dept_emp USING(emp_no)
JOIN employees.departments USING(dept_no)
LIMIT 100;

-- Redo Code
DROP TABLE employees_with_departments;
-- Test the Code
SELECT * FROM employees_with_departments;

-- 2.
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

--3.
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