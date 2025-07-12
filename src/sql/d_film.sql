SELECT
	f.film_id,
	f.title,
	f.description,
	f.release_year,
	l.name AS language,
	ol.name AS original_language,
	f.rental_duration,
	f.rental_rate,
	f.length,
	f.replacement_cost,
	f.rating,
	f.last_update,
	f.special_features,
	f.fulltext,
    a.first_name AS actor_first_name,
    a.last_name AS actor_last_name,
    c.name AS category
FROM
	raw.film f
LEFT JOIN raw.language l 
    ON f.language_id = l.language_id
LEFT JOIN raw.language ol 
    ON f.original_language_id = ol.language_id
LEFT JOIN raw.film_actor fa 
    ON f.film_id = fa.film_id
LEFT JOIN raw.actor a 
    ON fa.actor_id = a.actor_id
LEFT JOIN raw.film_category fc
    ON f.film_id = fc.film_id
LEFT JOIN raw.category c 
    ON fc.category_id = c.category_id