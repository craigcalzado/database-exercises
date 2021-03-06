-- SHOW DATABASES; shows a list of databases avalible. 
SHOW DATABASES;

-- USE; selects the database you want to use.
USE albums_db;
USE home_credit;

-- How many rows are in the albums table?
SELECT MAX(id)
FROM albums;
-- How many rows are in the home_credit database?
SELECT COUNT(*);
-- This SQL query shows the number of tables within the database.
-- Show all tables in home_credit 
USE home_credit;
SHOW TABLES;
-- The SQL query above is useing home_credit database and howing all the tables within the database

-- How many unique artist names are in the albums table?
SELECT COUNT(DISTINCT artist)
FROM albums;
-- How man unique rows are there in application_history
SELECT *
FROM application_history;


-- What is the primary key for the albums table?
DESCRIBE albums;

-- What is the oldest release date for any album in the albums table? What is the most recent release date?
SELECT MIN(release_date)
FROM albums;
SELECT MAX(release_date)
FROM albums;

-- The name of all albums by Pink Floyd?
SELECT *
FROM albums
WHERE artist = 'Pink Floyd'; 

-- The year Sgt. Pepper's Lonely Hearts Club Band was released?
SELECT release_date
FROM albums
Where name = "Sgt. Pepper's Lonely Hearts Club Band";

-- The genre for the album Nevermind?
SELECT genre
FROM albums
Where name = "Nevermind";

-- Which albums were released in the 1990s?
SELECT *
FROM albums
WHERE release_date BETWEEN '1990' AND '1999';

-- Which albums had less than 20 million certified sales?
SELECT * 
FROM albums
WHERE sales < '20.0';

-- All the albums with a genre of "Rock".
SELECT *
FROM albums 
WHERE genre LIKE '%Rock%';
