-- CASE1

SELECT COUNT(*) FROM film
WHERE length > (
	SELECT AVG(length) FROM film
);

-- CASE2

SELECT COUNT(*) FROM film
WHERE rental_rate = (
	SELECT MAX(rental_rate) FROM film
);

-- CASE3

SELECT * FROM film
WHERE rental_rate = (
	SELECT MIN(rental_rate) FROM film
) AND  replacement_cost =  (
	SELECT MIN(replacement_cost) FROM film)
ORDER BY rental_rate,replacement_cost;

-- CASE4

SELECT customer_id, COUNT(*) AS numberOfPurchases 
FROM payment 
GROUP BY customer_id 
ORDER BY numberOfPurchases DESC;
