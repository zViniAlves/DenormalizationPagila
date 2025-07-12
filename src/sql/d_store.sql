SELECT 
	store.store_id,
	staff.first_name AS manager_first_name,
	staff.last_name AS manager_last_name,
	staff.email AS manager_email,
	staff.active AS manager_active,
	staff.username AS manager_username,
	staff.password AS manager_password,
	staff.last_update AS manager_last_update,
	store.address_id,
	store.last_update AS last_store_update
FROM
	raw.store store
LEFT JOIN raw.staff staff
	ON store.manager_staff_id = staff.staff_id