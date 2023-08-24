(SELECT p.name,
       count(*) AS count,
       'visit' AS action_type
FROM person_visits
INNER JOIN pizzeria p on person_visits.pizzeria_id = p.id
GROUP BY name
ORDER BY count DESC, name
LIMIT 3)
UNION
(SELECT p.name,
       count(*) AS count,
       'order' AS action_type
FROM person_order
INNER JOIN menu m on person_order.menu_id = m.id
INNER JOIN pizzeria p on m.pizzeria_id = p.id
GROUP BY name
ORDER BY count DESC, name
LIMIT 3)
ORDER BY action_type, count DESC;