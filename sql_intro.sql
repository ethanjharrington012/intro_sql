-- select all query, to pull all actors from actor tables
SELECT *
FROM actor;

-- SELECT *
-- FROM address;

-- Query for first name and last name from actor table
SELECT first_name, last_name
FROM actor;

SELECT *
FROM film;

-- Query for a first_name that equals Nick using the WHERE clause
SELECT first_name, last_name
FROM actor
WHERE first_name in ('Nick', 'nick');

--Query for first_name that is equal to Nick using the LIKE and WHERE clauses
SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'John%';

-- whildcard  <-- holds the place of anything that could populate that spot

SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'J%';

--__<-- holds the place of possible letters
SELECT *
FROM actor
WHERE first_name LIKE 'K__';

--Query for all first name data that starts with a K and ends with th
-- using the LIKE and WHERE clauses -- using Both wildcard and underscore

SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'J%___';

--Compreing Oporators
-- greater than > less than <
-- greater than or equal to >=
-- less than or equal to <=
-- not equal <>

--Query to view all data in payment table
SELECT *
FROM payment;

-- Query for data that shows customers that paid an
-- amount > $2.00 for a rental
SELECT customer_id 
FROM payment
WHERE amount > 2.00;

-- Query for customers thats paid
-- under 7.99
SELECT customer_id, amount
FROM payment
WHERE amount < 7.99;

--Amount less than or equal to 5.00

SELECT customer_id, amount
FROM payment
WHERE amount <= 5.99;

--amount greater than 7.99
SELECT customer_id, amount
FROM payment
WHERE amount >= 7.99;

--QUERY for data that shows customers who paid 
-- an amount GREATER thsn or equal to 2.99
-- in acending order
SELECT customer_id, amount
FROM payment
WHERE amount >= 2.99
ORDER BY amount ASC;
-- ORDER BY defauls to ascending order
--asc ascending
--dsc decending

--Query for all amounts between 
--7.99 and 9.99
--using WHERE and BETWEEN
SELECT customer_id, amount
FROM payment
WHERE amount BETWEEN 7.99 AND 9.99;

--Query for data that shows customers who paid
--an amount NOT EQUAL to 5.99
-- in decending order
SELECT customer_id, amount
FROM payment
WHERE amount <> 5.99
ORDER BY amount DESC;


--SQL AGGREGATIONS --> SUM(), AVG(), COUNT(), MAX(), MIN()
SELECT SUM(amount)
FROM payment
WHERE amount > 5.99;


-- Query to display average amounts that are greater
-- than 5.99
SELECT AVG(amount)
FROM payment
WHERE amount > 5.99;

-- Query to display the count of amounts paid greater than 5.99
SELECT COUNT(amount)
FROM payment
WHERE amount > 5.99;


-- DISTINCT RETURNS unique instances
-- using DISTINCT(culumn name)
--  find the number of unique payment amounts over 5.99
SELECT COUNT(DISTINCT amount)
FROM payment
WHERE amount > 5.99;


-- query to display min amount greater than 7.99
SELECT MIN(amount) AS MIN_NUM_PAYMENTS
FROM payment
WHERE amount > 7.99;


-- QUERY TO display the max amount greater than 7.99
SELECT MAX(amount) AS max_num_payments
FROM payment
WHERE amount < 7.99;


-- / Query to display all amountsd equal to 7.99
SELECT amount 
FROM payment
WHERE amount = 7.99;

-- Group By
SELECT amount, COUNT(amount)
FROM payment
GROUP BY amount
ORDER BY amount;

-- How much each customer id has paid for rentals
SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC;


SELECT customer_id, amount
FROM payment
GROUP BY amount, customer_id
ORDER BY customer_id DESC;

SELECT *
FROM customer;
SELECT COUNT(first_name),first_name
FROM customer
WHERE first_name LIKE 'J%'
GROUP BY first_name
HAVING COUNT(first_name) > 1;


-- My homework below vv

-- 1. 2
-- 2. 5607
-- 3. Multiple films are tied at 8
-- 4. 0
-- 5. 1 - 8040
-- 6. 378
-- 7. film_id 508 - 15 actors
-- 8. 13
-- 9. 3
-- 10. 5 ratings, PG-13 has the most

-- First question
SELECT last_name, COUNT(last_name)
FROM actor
WHERE last_name LIKE 'Wahlberg'
GROUP BY last_name;

-- Second question
SELECT COUNT(amount)
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99;


-- third question
SELECT MAX(film_id) AS max_amount
FROM inventory;


-- fourth question
SELECT COUNT(last_name)
FROM customer
WHERE last_name LIKE 'William';


-- Fith Question

SELECT staff_id, COUNT(rental_id)
FROM rental
GROUP BY staff_id;

-- 6TH Question

SELECT COUNT(DISTINCT district)
FROM address;

-- 7th Question
SELECT MAX(film_id)
FROM film;

-- 8TH QUESTION
SELECT last_name
FROM customer
WHERE last_name LIKE '%es';

-- 9th Question

-- How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
-- with ids between 380 and 430? (use group by and having > 250)
-- 9. 3

SELECT amount, COUNT(amount)
FROM payment
WHERE customer_id BETWEEN 380 AND 430
GROUP BY amount
HAVING COUNT(amount) > 250;

-- QUESTION 10

-- Within the film table, how many rating categories are there? And what rating has the most
-- movies total?
SELECT rating, COUNT(rating)
FROM film
GROUP BY rating
ORDER BY rating DESC;

SELECT COUNT(DISTINCT rating)
FROM film;
