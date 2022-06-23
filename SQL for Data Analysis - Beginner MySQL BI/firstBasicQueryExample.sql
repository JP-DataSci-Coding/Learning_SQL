-- 'USE' syntax tells the server that you want to use a specific database; 
USE mavenmovies;

-- You can also just right click and set a schema as the default schema instead of the 'USE' syntax.

-- * means all columns, be careful though as this can be very slow.
SELECT * 
FROM rental;

SELECT *
FROM inventory;

SELECT
	rental_id,
    rental_date
FROM rental;

