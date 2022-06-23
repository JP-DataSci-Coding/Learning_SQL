-- 'WHERE' is used to provide criteria for filtering your records.
-- It is an optional clause and always comes after your FROM syntax
-- and any 'GROUP BY', 'ORDER BY' and 'HAVING' clauses.
-- You can also use 'AND/OR' with your WHERE clauses.

-- The WHERE clauses uses pretty the same conditional operators as other programming languages.
-- Except, the equals is just = instead of == and does not equal is <>.
-- 'BETWEEN' is used with WHERE to specify a range, where the beginning and end is included, i.e. inclusive.
-- 'IN()' checks whether a value is in the list specified:
-- WHERE Country IN ('Germany', 'France', 'UK');
-- WHERE Country NOT IN ('Germany', 'France', 'UK');
-- 'LIKE' means - matching a pattern like this, i.e. uses wild cards.

USE mavenmovies;

SELECT *
FROM payment
WHERE customer_id < 101;

SELECT *
FROM payment
WHERE customer_id <= 100;

-- BETWEEN and 'AND' can be used to specify the range. 

SELECT *
FROM payment
WHERE customer_id BETWEEN 1 AND 100;

-- However, AND also acts as the && condition, i.e. all conditions must be met.

SELECT *
FROM payment
WHERE customer_id <= 100 
	AND amount > 5.00 
	AND payment_date >= '2006-01-01';
    
-- Again, like code, we have an 'OR' operator to pull records that meet any of the conditions.

SELECT *
FROM payment
WHERE 
	(customer_id = 42
    OR customer_id = 53
    OR customer_id = 60
    OR customer_id = 75)
    AND (amount > 5.00);
    
SELECT *
FROM payment
WHERE amount > 5.00 
	AND customer_id IN (42, 53, 60, 75);

-- Let us now try 'LIKE'
-- LIKE 'Pattern'
-- We can also use wild cards like:
-- % which represents any number of characters
-- _ which represents just one character

SELECT
	title,
    special_features
FROM film
WHERE special_features LIKE '%Behind the Scenes%'



