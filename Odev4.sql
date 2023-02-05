--CASE1
SELECT DISTINCT replacement_cost FROM film;

--CASE2
SELECT COUNT(DISTINCT replacement_cost) FROM film;

--CASE3
SELECT COUNT(*) FROM film
WHERE title LIKE('T%') AND rating = 'G';

--CASE4
SELECT COUNT(country) FROM country
WHERE country LIKE('_____') 

--CASE5
SELECT COUNT(city) FROM city
WHERE city ILIKE('%r')


