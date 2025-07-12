SELECT
	raw.rental.rental_id,
	raw.rental.rental_date,
	raw.rental.return_date,
	raw.rental.staff_id AS rental_staff_id,
	raw.rental.last_update AS last_rental_update,
	raw.rental.inventory_id,
	raw.inventory.film_id,
	raw.inventory.store_id,
	raw.inventory.last_update AS last_inventory_update,
	raw.payment.payment_id,
	raw.payment.customer_id,
	raw.payment.staff_id AS payment_staff_id,
	raw.payment.amount,
	raw.payment.payment_date
FROM
	raw.rental
LEFT JOIN raw.inventory
	ON raw.rental.inventory_id = raw.inventory.inventory_id
LEFT JOIN raw.payment
	ON raw.rental.rental_id = raw.payment.rental_id