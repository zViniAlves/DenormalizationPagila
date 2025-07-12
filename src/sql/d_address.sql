SELECT
    address.address_id,
    address.address,
    address.address2,
    address.district,
    address.postal_code,
    address.phone,
    address.last_update as last_address_update,
    city.city,
    city.last_update AS last_city_update,
    country.country,
    country.last_update AS last_country_update
FROM
    raw.address address
LEFT JOIN raw.city city
    ON address.city_id = city.city_id
LEFT JOIN raw.country country
    ON city.country_id = country.country_id