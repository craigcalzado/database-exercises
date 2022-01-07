SHOW DATABASES;

USE albums_db;

SELECT MAX(id)
FROM albums;

SELECT COUNT(DISTINCT artist)
FROM albums;

SELECT id
FROM albums;

SELECT MIN(release_date)
FROM albums;
SELECT MAX(release_date)
FROM albums;

SELECT *
FROM albums
WHERE artist = 'Pink Floyd'; 

SELECT release_date
FROM albums
Where name = "Sgt. Pepper's Lonely Hearts Club Band";

SELECT genre
FROM albums
Where name = "Nevermind";

SELECT *
FROM albums
WHERE release_date BETWEEN '1990' and '1999';

SELECT * 
FROM albums
WHERE sales < '20.0';

SELECT *
FROM albums 
WHERE genre = 'Rock';
