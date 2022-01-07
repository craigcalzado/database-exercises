SHOW DATABASES;
-- utilizing chipotle
USE chipotle;
-- what is in there
SHOW TABLES;
DESCRIBE orders;

-- talking about WHERE
USE albums_db;

-- useing where to find exact matches
SELECT *
FROM albums 
WHERE genre = 'Rock';
-- Like will allow flexability
SELECT *
FROM albums 
WHERE genre
LIKE '%Rock%';

-- % wildcard to pad out characters we want to ignore
SELECT name 
AS album_name, artist
AS band
FROM albums
WHERE release_date
BETWEEN 1990 
AND 1999;

-- AND is strick OR is more flexable
-- Chaining boolean statements with WHERE
USE chipotle;
SELECT * FROM orders;

-- OR
SELECT *
FROM orders
WHERE choice_description
LIKE '%Beans%'
Or order_id = 5;

-- AND
SELECT *
FROM orders
WHERE choice_description
LIKE '%Beans%'
AND order_id = 5;

-- Null example
SELECT * 
FROM orders;

SELECT * 
FROM orders
WHERE choice_description 
IS NULL;

-- changed database
SHOW DATABASES;
USE world;

-- changed databases again
SHOW DATABASES;
USE albums_db;

-- IN example
SELECT *
FROM albums 
WHERE genre IN ('Rock', 'Hard Rock');

-- ORDER BY

SELECT name
FROM albums
ORDER BY name DESC;


 

