-- CONCAT (string concatenation)

-- breakage
SELECT 'Hello' + 'World';

-- CORRECT
SELECT 4 + 5;
SELECT CONCAT('Hello', 'World', '!');

-- first arg: subject
-- second arg: starting character
-- third: # of charatcters

-- REMEMBER!: indexing in SQL starts at 1, not zero

SELECT SUBSTR('Hello World!', 3, 4);

-- UPPER / LOWER
SELECT LOWER('HEllO world');
SELECT UPPER('hello World');

-- CONCAT on a table ???????
SHOW DATABASES;

USE albums_db;
SELECT CONCAT(name, ' by ' ,artist);

-- NOW
SELECT NOW();

-- Current Date, Time
SELECT CURDATE();
SELECT CURTIME();
SELECT UNIX_TIMESTAMP();

-- MATH Functions utilizing sales
SELECT * 
FROM albums
ORDER BY sales DESC
LIMIT 1;

SELECT MAX(sales) FROM albums;

SELECT artist,
MAX(sales)
FROM albums
GROUP BY artist;

-- something not working right
SELECT CAST(123 AS CHAR);

SELECT CAST(123 AS CHAR) AS charnum;