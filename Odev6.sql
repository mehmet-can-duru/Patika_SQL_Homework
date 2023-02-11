-- CASE1

SELECT AVG(rental_rate) FROM film;

-- CASE2

SELECT COUNT(title) FROM film
WHERE title LIKE 'C%';

-- CASE3

SELECT MAX(length) FROM film
WHERE rental_rate = 0.99;

-- CASE4

SELECT COUNT(DISTINCT(replacement_cost)) FROM film
WHERE length > 150;