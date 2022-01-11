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
FROM users
LEFT JOIN roles ON users.role_id = roles.id;

SELECT *
FROM users
RIGHT JOIN roles ON users.role_id = roles.id;

-- Although not explicitly covered in the lesson, aggregate functions like count can be used with join queries. Use count and the appropriate join type to get a list of roles along with the number of users that has the role. Hint: You will also need to use group by in the query.

SELECT roles.name, COUNT(*) AS 'number_of_users'
FROM roles
LEFT JOIN users ON users.role_id = roles.id
GROUP BY roles.name;

--
