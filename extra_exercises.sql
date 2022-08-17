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
