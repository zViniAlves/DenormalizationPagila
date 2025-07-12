SELECT
    raw.address.address_id,
    raw.address.address,
    raw.address.address2,
    raw.address.district,
    raw.address.postal_code,
    raw.address.phone,
    raw.address.last_update as last_address_update,
    raw.city.city,
    raw.city.last_update AS last_city_update,
    raw.country.country,
    raw.country.last_update AS last_country_update
FROM
    raw.address
LEFT JOIN raw.city
    ON raw.address.city_id = raw.city.city_id
LEFT JOIN raw.country
    ON raw.city.country_id = raw.country.country_id