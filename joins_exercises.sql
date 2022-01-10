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
FROM roles
JOIN users ON roles.id = users.role_id;
 

