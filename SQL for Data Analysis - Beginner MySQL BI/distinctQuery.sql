-- 'DISTINCT' will pull all the unique values in a column(s).
-- This can be useful for viewing all possible values in a column.
SELECT DISTINCT
	rental_duration
FROM film;

-- When used with more than one column, unique rows are returned, that is, it does not return two rows with the
-- exact same values.
SELECT DISTINCT
	rental_duration,
    title
FROM film;