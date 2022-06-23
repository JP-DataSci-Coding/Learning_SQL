/* 
1. My partner and I want to come by each of the stores in person and meet the managers. 
Please send over the managers’ names at each store, with the full address 
of each property (street address, district, city, and country please).  
*/ 

SELECT
	staff.first_name,
    staff.last_name,
    address.address,
    address.district,
    city.city,
    country.country
FROM store
	INNER JOIN staff
		ON store.manager_staff_id = staff.staff_id
	INNER JOIN address
		ON store.address_id = address.address_id
	INNER JOIN city
		ON address.city_id = city.city_id
	INNER JOIN country
		ON city.country_id = country.country_id;

	
/*
2.	I would like to get a better understanding of all of the inventory that would come along with the business. 
Please pull together a list of each inventory item you have stocked, including the store_id number, 
the inventory_id, the name of the film, the film’s rating, its rental rate and replacement cost. 
*/

SELECT
	inventory.store_id,
    inventory.inventory_id,
    film.title,
    film.rating,
    film.rental_rate,
    film.replacement_cost
FROM inventory
	LEFT JOIN film
		ON inventory.film_id = film.film_id;

/* 
3.	From the same list of films you just pulled, please roll that data up and provide a summary level overview 
of your inventory. We would like to know how many inventory items you have with each rating at each store. 
*/

/*
You are getting the error GROUP BY clause and contains nonaggregated column 'myData.stateName' because the 
column stateName is not in the group by clause, just as it says. So it is saying that you are grouping some 
rows together and when the query tries to group the stateName column, it could having different values within 
the rows being grouped. The query does not know which one is the right value to show in the grouped row. 
You need to provide a way to tell the query which value is the right value to keep in grouped row. Say you have 
a number column, and in the rows you are grouping together has the values 1,2,3 and 4. You can say i want the 
highest number from those groups of numbers and do this by MAX(column_name) and the grouped row will show 4.

In your query, if all the values in stateName are the same in the rows being grouped, just add the stateName in 
your group by clause.
*/
SELECT
	inventory.store_id,
    COUNT(inventory.inventory_id) AS 'Total Inventory',
    film.rating
FROM inventory
	LEFT JOIN film
		ON inventory.film_id = film.film_id
GROUP BY
	inventory.store_id,
	film.rating;

/* 
4. Similarly, we want to understand how diversified the inventory is in terms of replacement cost. We want to 
see how big of a hit it would be if a certain category of film became unpopular at a certain store.
We would like to see the number of films, as well as the average replacement cost, and total replacement cost, 
sliced by store and film category. 
*/ 

SELECT
	inventory.store_id,
    category.name AS 'Category',
    COUNT(film_category.film_id) AS 'Total Number Of Films',
    AVG(film.replacement_cost) AS 'Avg Replacement Cost',
    SUM(film.replacement_cost) AS 'Total Replacement Cost'
FROM inventory
	LEFT JOIN film
		ON inventory.film_id = film.film_id
	LEFT JOIN film_category
		ON film.film_id = film_category.film_id
	LEFT JOIN category
		ON film_category.category_id = category.category_id
GROUP BY
	inventory.store_id,
    category.name;

/*
5.	We want to make sure you folks have a good handle on who your customers are. Please provide a list 
of all customer names, which store they go to, whether or not they are currently active, 
and their full addresses – street address, city, and country. 
*/

SELECT
	customer.first_name,
    customer.last_name,
    customer.store_id,
    CASE
		WHEN customer.active = 1 THEN 'Active'
        WHEN customer.active = 0 THEN 'Inactive'
	END AS 'Active?',
    address.address,
    city.city,
    country.country
FROM customer
	LEFT JOIN address
		ON customer.address_id = address.address_id
	LEFT JOIN city
		ON address.city_id = city.city_id
	LEFT JOIN country
		ON city.country_id = country.country_id;

/*
6.	We would like to understand how much your customers are spending with you, and also to know 
who your most valuable customers are. Please pull together a list of customer names, their total 
lifetime rentals, and the sum of all payments you have collected from them. It would be great to 
see this ordered on total lifetime value, with the most valuable customers at the top of the list. 
*/












    
/*
7. My partner and I would like to get to know your board of advisors and any current investors.
Could you please provide a list of advisor and investor names in one table? 
Could you please note whether they are an investor or an advisor, and for the investors, 
it would be good to include which company they work with. 
*/











/*
8. We're interested in how well you have covered the most-awarded actors. 
Of all the actors with three types of awards, for what % of them do we carry a film?
And how about for actors with two types of awards? Same questions. 
Finally, how about actors with just one award? 
*/

