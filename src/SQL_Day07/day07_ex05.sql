SELECT DISTINCT p.name
FROM person_order
INNER JOIN person p on person_order.person_id = p.id
ORDER BY name;