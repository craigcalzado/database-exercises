-- This exercise is designed to become familiar with databases
-- To begin after you signed in to your desired database you use SHOW DATABASES to see what data bases you have access too.
SHOW DATABASES;

-- Once you identified the database you utilize the USE command to call that data base.
USE employees;

-- Within the database you can view which tables are there to explore with the SHOW Tables function.
SHOW TABLES;

-- Describe and then the database shows the name of the fields the type of data within that field if there are any nulls, shows any keys (primary or foreign).
DESCRIBE employees; 

-- Not ony can you use the describe function on the data base but on individual tables.
DESCRIBE salaries;

-- Here we are going to look at multiple tables using the describe function.
DESCRIBE titles;

DESCRIBE dept_emp;

DESCRIBE dept_manager;

DESCRIBE departments;

DESCRIBE employees;

DESCRIBE dept_emp;

-- The SHOW CREATE TABLE show the sql command that created the tables you select.
SHOW CREATE TABLE dept_manager;
