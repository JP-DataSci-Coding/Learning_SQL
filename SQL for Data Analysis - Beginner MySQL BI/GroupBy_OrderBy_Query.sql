/* Let us try 'GROUP BY' clauses.
Say we are interested in getting a summary of how many films have specific ratings. */

/* The query below will select records from the rating and film_id columns. Then, it will count the
number of film ids and group them by the unique rating values.*/
SELECT
	rating,
    COUNT(film_id) -- Here, COUNT acts as the aggregate query.
FROM film
GROUP BY rating; -- Note! We always have to specify the non-aggregated column using GROUP BY.

SELECT
	rental_duration,
    COUNT(title) AS 'Num Films With Rental Duration' -- 'AS' can be used to use an alias for a column.
FROM film
GROUP BY rental_duration;

/* The query below will count the number of titles and group them by unique title and rental duration. It 
will also rename the column with the count values to 'Num Films With Rental Duration'.*/
SELECT
	rental_duration,
    title,
    COUNT(title) AS 'Num Films With Rental Duration' -- 'AS' can be used to use an alias for a column.
FROM film
GROUP BY 
	rental_duration,
    title;
    
SELECT
	length,
	MAX(rental_rate) as 'Max Rental Rate'
FROM film
GROUP BY length;


    