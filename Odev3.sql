--CASE1
SELECT country FROM country
WHERE country LIKE('A%a');

--CASE2
SELECT country FROM country
WHERE country LIKE('______%n');

--CASE3
SELECT title FROM film
WHERE title ILIKE('%T%T%T%T');

--CASE4
SELECT * FROM film
WHERE title LIKE('C%') AND length > 90 AND rental_rate = 2.99;
