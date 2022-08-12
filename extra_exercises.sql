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
