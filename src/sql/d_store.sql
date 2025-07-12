SELECT 
	raw.store.store_id,
	raw.staff.first_name AS manager_first_name,
	raw.staff.last_name AS manager_last_name,
	raw.staff.email AS manager_email,
	raw.staff.active AS manager_active,
	raw.staff.username AS manager_username,
	raw.staff.password AS manager_password,
	raw.staff.last_update AS manager_last_update,
	raw.store.address_id,
	raw.store.last_update AS last_store_update
FROM
	raw.store
LEFT JOIN raw.staff
	ON raw.store.manager_staff_id = raw.staff.staff_id