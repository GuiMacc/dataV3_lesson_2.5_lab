USE sakila;

-- 1. Select all the actors with the first name ‘Scarlett’.

SELECT * FROM actor
WHERE (first_name='Scarlett');

-- 2. How many films (movies) are available for rent and how many films have been rented?

SELECT COUNT(DISTINCT film_id) AS 'nº of movies for rent', COUNT(DISTINCT rental_duration) AS 'nº of movies rentted' FROM film;

-- 3. What are the shortest and longest movie duration? Name the values max_duration and min_duration.

SELECT MAX(length) AS 'max_duration', MIN(length) AS 'min_duration' FROM film;

-- 4. What's the average movie duration expressed in format (hours, minutes)?

SELECT CONVERT(AVG(length), time) AS 'average movie length in h:min' FROM film;

-- 5. How many distinct (different) actors' last names are there?

SELECT COUNT(DISTINCT last_name) AS 'nº of last names' FROM actor;

-- 6. Since how many days has the company been operating (check DATEDIFF() function)?

SELECT DATEDIFF( MAX(payment_date), MIN(payment_date))  AS ' total operating days' FROM payment;

-- 7. Show rental info with additional columns month and weekday. Get 20 results.

SELECT *, date_format(CONVERT(rental_date,date), "%M") AS 'month', date_format(CONVERT(rental_date,date), "%a") AS 'weekday' FROM rental;

-- 8. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.

SELECT *, date_format(CONVERT(rental_date,date), "%M") AS 'month', date_format(CONVERT(rental_date,date), "%a") AS 'weekday',
CASE
WHEN date_format(CONVERT(rental_date,date), "%a") IN ('Sat', 'Sun') then 'weekend'
ELSE 'weekday'
END AS 'day_type'
FROM rental;

-- 9. Get release years.

SELECT DISTINCT(release_year) FROM film;

-- 10. Get all films with ARMAGEDDON in the title.

SELECT distinct(title) FROM film
WHERE title IN ('ARMAGEDDON');

-- 11. Get all films which title ends with APOLLO.

SELECT distinct(title) FROM film
WHERE title LIKE '%APOLLO';

-- 12. Get 10 the longest films.

SELECT title, length FROM film
ORDER BY length DESC
LIMIT 10;

-- 13. How many films include Behind the Scenes content?

SELECT COUNT(distinct film_id) FROM film
WHERE special_features IN ('Behind the Scenes');