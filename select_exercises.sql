SHOW DATABASES;

USE albums_db;

-- How many rows are in the albums table?
SELECT MAX(id)
FROM albums;

-- How many unique artist names are in the albums table?
SELECT COUNT(DISTINCT artist)
FROM albums;

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
