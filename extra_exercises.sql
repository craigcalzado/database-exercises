-- Within this document we will be using the following terms: SELECT, DISTINCT, WHERE, IN, BETWEEN, LIKE, LIMIT, ORDER BY, and JOIN.

-- 1. SELECT statements
-- a. Select all columns from the actor table.
USE sakila;
SELECT * 
FROM actor;
-- The query above returns all actors from the actor table within sakila database.

-- b. Select the first and last name columns from the actor table.
SELECT first_name, last_name 
FROM actor;
-- The query above returns the first and last name columns from the actor table within sakila database.

-- c. Select only the film_id, title, and release_year columns from the film table.
SELECT film_id, title, release_year 
FROM film;
-- The query above returns the film_id, title, and release_year columns from the film table within sakila database.

-- 2. DISTINCT operator
-- a. Select all distinct (different) last names from the actor table.
SELECT DISTINCT last_name
FROM actor;
-- The query above returns all distinct (different) last names from the actor table within sakila database.

-- b. Select all distinct (different) postal codes from the address table.
SELECT DISTINCT postal_code
FROM address;
-- The query above returns all distinct (different) postal codes from the address table within sakila database.

-- c. Select all distinct (different) ratings from the film table.
SELECT DISTINCT rating
FROM film;
-- The query above returns all distinct (different) ratings from the film table within sakila database.

-- 3.WHERE clause
-- a. Select the title, description, rating, movie length columns from the films table that last 3 hours or longer.
SELECT title, description, rating, length
FROM film
WHERE length >= 180;

-- b. Select the payment id, amount, and payment date columns from the payments table for payments made on or after 05/27/2005.
SELECT payment_id, amount, payment_date
FROM payment
WHERE payment_date >= '2005-05-27';

-- c.Select the primary key, amount, and payment date columns from the payment table for payments made on 05/27/2005.
SELECT payment_id, amount, payment_date
FROM payment
WHERE payment_date = '2005-05-27';

-- d.Select all columns from the customer table for rows that have a last names beginning with S and a first names ending with N.
SELECT *
FROM customer
WHERE last_name 
LIKE 'S%' 
AND first_name 
LIKE '%N';

-- e. Select all columns from the customer table for rows where the customer is inactive or has a last name beginning with "M".
SELECT *
FROM customer
WHERE active = 0 
OR last_name 
LIKE 'M%';

-- f.Select all columns from the category table for rows where the primary key is greater than 4 and the name field begins with either C, S or T.
SELECT *
FROM category
WHERE category_id > 4
AND name
LIKE '[CST]%';

-- g. Select all columns minus the password column from the staff table for rows that contain a password.
SELECT staff_id, first_name, last_name, address_id, email, store_id, active, username, last_update
FROM staff
WHERE password IS NOT NULL;

-- h. Select all columns minus the password column from the staff table for rows that do not contain a password.
SELECT staff_id, first_name, last_name, address_id, email, store_id, active, username, last_update
FROM staff
WHERE password IS NULL;

-- 4.IN operator

-- a.Select the phone and district columns from the address table for addresses in California, England, Taipei, or West Java.
SELECT phone, district
FROM address
WHERE district 
IN ('California', 'England', 'Taipei', 'West Java');

-- b.Select the payment id, amount, and payment date columns from the payment table for payments made on 05/25/2005, 05/27/2005, and 05/29/2005. (Use the IN operator and the DATE function, instead of the AND operator as in previous exercises.)
SELECT payment_id, amount, payment_date
FROM payment
WHERE payment_date 
IN ('2005-05-25', '2005-05-27', '2005-05-29');

-- c.Select all columns from the film table for films rated G, PG-13 or NC-17.
SELECT *
FROM film
WHERE rating
IN ('G', 'PG-13', 'NC-17');

-- 5. BETWEEN operator

-- a. Select all columns from the payment table for payments made between midnight 05/25/2005 and 1 second before midnight 05/26/2005.
SELECT *
FROM payment
WHERE payment_date
BETWEEN '2005-05-25 00:00:00' AND '2005-05-26 23:59:59';

-- b. Select the film_id, title, and descrition columns from the film table for films where the length of the description is between 100 and 120.
SELECT film_id, title, description
FROM film
WHERE length(description)
BETWEEN 100 AND 120;

-- 6. LIKE operator

-- a. Select the following columns from the film table for rows where the description begins with "A Thoughtful".
SELECT film_id, title, description
FROM film
WHERE description
LIKE 'A Thoughtful%';

-- b. Select the following columns from the film table for rows where the description ends with the word "Boat".
SELECT film_id, title, description
FROM film
WHERE description
LIKE '%Boat';

-- c. Select the following columns from the film table where the description contains the word "Database" and the length of the film is greater than 3 hours.
SELECT film_id, title, description
FROM film
WHERE description
LIKE '%Database%'
AND length > 180;

-- 7. ORDER BY statement

-- a.Select all columns from the film table and order rows by the length field in ascending order.
SELECT *
FROM film
ORDER BY length;

-- b. Select all distinct ratings from the film table ordered by rating in descending order.
SELECT DISTINCT rating
FROM film
ORDER BY rating DESC;

-- c. Select the payment date and amount columns from the payment table for the first 20 payments ordered by payment amount in descending order.
SELECT payment_date, amount
FROM payment
ORDER BY amount DESC
LIMIT 20;

-- d. Select the title, description, special features, length, and rental duration columns from the film table for the first 10 films with behind the scenes footage under 2 hours in length and a rental duration between 5 and 7 days, ordered by length in descending order.
SELECT title, description, special_features, length, rental_duration
FROM film
WHERE length < 120
AND rental_duration BETWEEN 5 AND 7
ORDER BY length DESC
LIMIT 10;

-- 8. JOINs

-- a. Select customer first_name/last_name and actor first_name/last_name columns from performing a left join between the customer and actor column on the last_name column in each table. (i.e. customer.last_name = actor.last_name)
-- Label customer first_name/last_name columns as customer_first_name/customer_last_name
-- Label actor first_name/last_name columns in a similar fashion.
-- returns correct number of records: 620
SELECT customer.first_name, customer.last_name, actor.first_name, actor.last_name
FROM customer
LEFT JOIN actor
ON customer.last_name = actor.last_name;

-- b.Select the customer first_name/last_name and actor first_name/last_name columns from performing a /right join between the customer and actor column on the last_name column in each table. (i.e. customer.last_name = actor.last_name)
-- returns correct number of records: 200
SELECT customer.first_name, customer.last_name, actor.first_name, actor.last_name
FROM customer
RIGHT JOIN actor
ON customer.last_name = actor.last_name;

-- c. Select the customer first_name/last_name and actor first_name/last_name columns from performing an inner join between the customer and actor column on the last_name column in each table. (i.e. customer.last_name = actor.last_name)
-- returns correct number of records: 43
SELECT customer.first_name, customer.last_name, actor.first_name, actor.last_name
FROM customer
INNER JOIN actor
ON customer.last_name = actor.last_name;

-- d.Select the city name and country name columns from the city table, performing a left join with the country table to get the country name column.
-- Returns correct records: 600
DESCRIBE city;

SELECT city.city, city.country_id, country.country
FROM city
LEFT JOIN country
ON city.country_id = country.country_id;

-- e.Select the title, description, release year, and language name columns from the film table, performing a left join with the language table to get the "language" column.
-- Label the language.name column as "language"
-- Returns 1000 rows
SELECT film.title, film.description, film.release_year, film.language_id, language.language_id, language.name language
FROM film
LEFT JOIN language
ON film.language_id = language.language_id;

-- f.Select the first_name, last_name, address, address2, city name, district, and postal code columns from the staff table, 
-- performing 2 left joins with the address table then the city table to get the address and city related columns.
-- returns correct number of rows: 2
SELECT s.first_name, s.last_name, s.address_id, a.address_id, a.address, a.address2, a.city_id, a.district, a.postal_code, c.city_id, c.city
FROM staff s
LEFT JOIN address a
ON s.address_id = a.address_id
LEFT JOIN city c
On c.city_id = a.city_id;
