-- Note! Look at slide 124 for a nice comparison of the JOIN queries.

/*
Note! To apply join between two tables, one table must contain a column that is a reference for 
the other table. So columns like last_updated cannot be a JOIN column.
*/

-- INNER JOIN --

/* 
Returns records that exist in BOTH tables only 

FROM left_table
INNER JOIN right_table
ON left_table.column_name = right_table.column_name
*/

/* 
Note! Sometimes, you may come across the error 'column is ambiguous'.
This means that you are referencing a column name which appears in more than
one of your joined tables, and you have not specified which table you want to use.

This is why, after the SELECT statement, you should always specify the table name.
*/


/* 
The 'ON' clause defines the relationship between the tables, i.e., to specify the criteria for joining/pairing rows
between two or more tables. This is different to the 'WHERE' clause, which filters the paired rows.

So, the query below will join the inventory and rental tables where the inventory ID exists in both tables.
*/
SELECT DISTINCT
	inventory.inventory_id
FROM inventory
	INNER JOIN rental
		ON inventory.inventory_id = rental.inventory_id        
LIMIT 5000; -- SQL by default returns the first 1000 records, we can use LIMIT to increase/decrease it.

SELECT
	inventory.inventory_id,
	film.title,
    film.description,
    inventory.store_id
FROM film
	INNER JOIN inventory
		ON film.film_id = inventory.film_id
LIMIT 5000;


-- LEFT JOIN ---

/* 
Returns ALL records from the left table and any matching records from
the right table.

FROM left_table_name
LEFT JOIN right_table_name
ON left_table.column_name = right_table.column_name

Note! Essentially, you use LEFT JOIN when you want additional data from a second table. 
This is a very common query.
*/

/*
The query below gives us the actor's first and last names, and the total number of films they have been in. 
It will give us all of the records from the actor table and also records from the film_actor table.
*/
SELECT
	actor.first_name,
    actor.last_name,
    COUNT(film_actor.film_id) AS 'Number of Films'
FROM actor
	LEFT JOIN film_actor
		ON actor.actor_id = film_actor.actor_id
GROUP BY
	actor.first_name,
    actor.last_name;
    
/*
The query below will have some records that null values for the awards column 
as some actors did not win anything. Therefore, it will return 200 records.
*/ 
SELECT
	actor.first_name,
    actor.last_name,
    awards
FROM actor
	LEFT JOIN actor_award
		ON actor.actor_id = actor_award.actor_id;

-- Query below will return just 135 rows.
SELECT
	actor.first_name,
    actor.last_name,
    awards
FROM actor
	LEFT JOIN actor_award
		ON actor.actor_id = actor_award.actor_id
WHERE awards IS NOT NULL;

-- We can see that there are 65 actors with no awards.
SELECT
	actor.first_name,
    actor.last_name,
    awards
FROM actor
	LEFT JOIN actor_award
		ON actor.actor_id = actor_award.actor_id
WHERE awards IS NULL;

/*
Pulls a list of all film titles and the number of actors associated with each title.

We actually use the LEFT JOIN twice here to add the title column from the film table just for fun.
This is called 'bridging'.
*/

SELECT DISTINCT
	film_actor.film_id,
    title,
    COUNT(actor.actor_id) AS 'Number of Actors'
FROM film_actor
	LEFT JOIN actor
		ON film_actor.actor_id = actor.actor_id
	LEFT JOIN film
		ON film_actor.film_id = film.film_id
GROUP BY
	film_actor.film_id;

        
-- RIGHT JOIN ---

/* Returns ALL records from the right table and any matching records from
the left table.

FROM left_table_name
RIGHT JOIN right_table_name
ON left_table.column_name = right_table.column_name

So it is basically the opposite of LEFT JOIN. 

Note! It is best to never use RIGHT JOIN. It is pointless and can be considered to be bad practice.
*/

-- Multi-condition JOIN --

SELECT DISTINCT
			title,
            description
FROM film
	INNER JOIN inventory
		ON film.film_id = inventory.film_id
		WHERE inventory.store_id = 2;

-- Query below is the same as above, just a different way of writing it.
SELECT DISTINCT
			title,
            description
FROM film
	INNER JOIN inventory
		ON film.film_id = inventory.film_id
		AND inventory.store_id = 2;

SELECT DISTINCT
			title,
            description,
            inventory.film_id
FROM film
	INNER JOIN inventory
		ON film.film_id = inventory.film_id
		WHERE inventory.store_id = 2 AND (inventory.film_id < 10 OR inventory.film_id = 15);
        

-- FULL OUTER JOIN --

/* 
Returns records when there is a match in one of the tables. It does not matter if the
record does not match the other table.

Unfortunately, MySQL does not support the FULL OUTER JOIN query, so we must create it like so:

SELECT * FROM left_table
LEFT JOIN right_table 
ON left_table.column = right_table.column
UNION
SELECT * FROM left_table
RIGHT JOIN right_table
ON left_table.column = right_table.column

Note! By default, UNION removes all duplicate records, which is why we use it in the below query. If you
wish to keep duplicate rows, then use UNION ALL instead.

*/

SELECT
	film.film_id
FROM film
	FULL JOIN film_actor
		ON film.film_id = film_actor.film_id;

-- UNION --

/* Returns ALL data from one table, with ALL data from the other table appended to the end. 

SELECT columns FROM first_table_name
UNION
SELECT columns FROM second_table_name

Note! It is very easy to run into errors using the UNION statement:

- Column numbers need to be the same for both tables.
- Columns need to be in the same order.
- Columns need to be of the same data types.

Think of UNION as stacking two result sets on top of one another.
*/

SELECT
	first_name,
    last_name,
    'advisor' AS type
FROM advisor
UNION
SELECT
	first_name,
    last_name,
    'staff' AS type
FROM staff;






