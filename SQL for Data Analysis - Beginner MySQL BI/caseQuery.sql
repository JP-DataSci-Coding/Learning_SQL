USE mavenmovies;

-- CASE is used to create a new value for rows in a column based on various logical criteria.

/*The query below will create a new column called 'Fit for recommendation', 
using the 'CASE' statement by:

1. Selects the title column.
2. Then creates a new column, 'Fit For Recommendation'.
3. Inserts values based on the various CASE criteria.

*/
SELECT 
	title,
    CASE
		WHEN rental_duration <= 4 THEN 'Rental too short.'
        WHEN rental_rate >= 3.99 THEN 'Too expensive.'
        WHEN rating IN ('NC-17', 'R') THEN 'Too adult.'
        WHEN length NOT BETWEEN 60 AND 90 THEN 'Too short or too long.'
        ELSE 'Great for my niece'
	END AS 'Fit For Recommendation.'
FROM film;

/* You can also 'pivot' the table using COUNT and CASE together. Pivot means to view your data 
from a different angle. For example, you can use a column's values as new columns etc. */

/* The query below will:

1. Select the film_id column.
2. Counts the number of copies (inventory) of each film in store 1.
3. Records the count values in a new column 'Store 1 Copies'.
*/

SELECT
	film_id,
    COUNT(CASE WHEN store_id = 1 THEN inventory_id ELSE NULL END) AS 'Store 1 Copies'
FROM inventory
GROUP BY film_id
ORDER BY film_id;

SELECT
	film_id,
    COUNT(CASE WHEN store_id = 1 THEN inventory_id ELSE NULL END) AS 'Store 1 Copies',
    COUNT(CASE WHEN store_id = 2 THEN inventory_id ELSE NULL END) AS 'Store 2 Copies',
    COUNT(inventory_id) AS 'Total Copies'
FROM inventory
GROUP BY film_id
ORDER BY film_id; 

SELECT
	store_id,
    COUNT(CASE WHEN active = 0 THEN customer_id ELSE NULL END) AS 'Not Active Customers',
    COUNT(CASE WHEN active = 1 THEN customer_id ELSE NULL END) AS 'Active Customers'
FROM customer
GROUP BY store_id
ORDER BY store_id;




