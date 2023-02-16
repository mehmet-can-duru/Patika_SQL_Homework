-- CASE1

SELECT city, country FROM city
INNER JOIN country ON country.country_id = city.country_id;

-- CASE2

SELECT payment_id, first_name, last_name FROM customer
INNER JOIN payment ON payment.customer_id = customer.customer_id;

-- CASE3

SELECT rental_id, first_name, last_name FROM customer
INNER JOIN rental ON rental.customer_id = customer.customer_id;