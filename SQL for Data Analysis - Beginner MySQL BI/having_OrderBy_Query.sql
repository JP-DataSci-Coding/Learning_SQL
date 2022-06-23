/*
The WHERE clause filtered each record, but HAVING filters each group. Basically, WHERE is used before
GROUP BY and HAVING is used after.
*/

/* The query below will:

1. Select customer_id and rental_id columns from the rental table.
2. Count the number of rental_id records.
3. Group the counted rental_id records by customer_id.
4. Filter the grouped records to only include those with rental_id counts of less than 15.
*/
SELECT 
	customer_id,
    COUNT(rental_id) AS 'Total Rentals'
FROM rental
GROUP BY customer_id
HAVING COUNT(rental_id) < 15;
    
-- The ORDER_BY clause specifies the order in which you want your results displayed.
-- ORDER_BY column_name(s)
-- Default is by ascending order, so you need to specify 'DESC' after the column name. 
-- Note! This clause must always come in last in the query.
/* Note! When you specify multiple columns, then the query will order the rows in the order
of the columns with the other columns acting as tie breakers.*/

/* The query below will 
SELECT
	title,
    length,
    rental_rate
FROM film
ORDER BY length DESC;






