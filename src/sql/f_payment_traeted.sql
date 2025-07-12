SELECT
	r.rental_id,
	r.rental_date,
	r.return_date,
	r.staff_id AS rental_staff_id,
	r.last_update AS last_rental_update,
	r.inventory_id,
	i.film_id,
	i.store_id,
	i.last_update AS last_inventory_update,
	p.payment_id,
	p.customer_id,
	p.staff_id AS payment_staff_id,
	p.amount,
	p.payment_date
FROM
	raw.rental r
LEFT JOIN raw.inventory i
	ON r.inventory_id = i.inventory_id
LEFT JOIN raw.payment p
	ON r.rental_id = p.rental_id