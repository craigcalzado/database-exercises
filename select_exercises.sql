-- SHOW DATABASES; shows a list of databases avalible. 
SHOW DATABASES;

-- USE; selects the database you want to use.
USE albums_db;

-- How many rows are in the albums table?
SELECT MAX(id)
FROM albums;
-- Answer: The max(id) is the highest id in the albums table. Which is 31.

-- How many rows are in the home_credit database?
SELECT COUNT(*);
-- This SQL query shows the number of tables within the database.
-- Show all tables in home_credit 
USE home_credit;
SHOW TABLES;
-- The SQL query above is useing home_credit database and howing all the tables within the database

-- How many unique artist names are in the albums table?
Use albums_db;

SELECT COUNT(DISTINCT artist)
FROM albums;
-- Answer: The count(distinct artist) is the number of unique artist names in the albums table. Which is 23.

-- How man unique rows are there in application_history
USE home_credit;

SELECT *
FROM application_history;
-- The '*' refrences all so this query would be read as select all from application history.

-- What is the primary key for the albums table?
USE albums_db;

-- DESCRIBE is a function used to identify the fields, types, and keys of a table.
DESCRIBE albums;
-- THe PRIMARY KEY is the id field.


-- What is the oldest release date for any album in the albums table? What is the most recent release date?
-- Select Min(desired field) allows us to find the lowest value within that field.
SELECT MIN(release_date)
FROM albums;
-- The min release date is 1967.
SELECT MAX(release_date)
FROM albums;
-- The max release date is 2011.

-- The name of all albums by Pink Floyd?
SELECT *
FROM albums
WHERE artist = 'Pink Floyd';
-- The query above is selecting all from the albums table where the artist is pink floyd.

-- The year Sgt. Pepper's Lonely Hearts Club Band was released?
SELECT release_date
FROM albums
Where name = "Sgt. Pepper's Lonely Hearts Club Band";
-- The query above is selecting the release date from the albums table where the name is "Sgt. Pepper's Lonely Hearts Club Band".

-- The genre for the album Nevermind?
SELECT genre
FROM albums
Where name = "Nevermind";
-- The query above is selecting the genre from the albums table where the name is "Nevermind".

-- Which albums were released in the 1990s?
SELECT *
FROM albums
WHERE release_date BETWEEN '1990' AND '1999';
-- The query above is selecting all from the albums table where the release date is between 1990 and 1999.

-- Which albums had less than 20 million certified sales?
SELECT * 
FROM albums
WHERE sales < '20.0';
-- The query above is selecting all from the albums table where the sales is less than 20.

-- All the albums with a genre of "Rock".
SELECT *
FROM albums 
WHERE genre LIKE '%Rock%';
-- The query above is selecting all from the albums table where the genre is like rock.
