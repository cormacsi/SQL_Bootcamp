SELECT pizza_name,
       p.name AS pizzeria_name
FROM menu m
JOIN person_order po on po.menu_id = m.id
JOIN pizzeria p on m.pizzeria_id = p.id
JOIN person p2 on po.person_id = p2.id
WHERE p2.name IN ('Denis', 'Anna')
ORDER BY pizza_name, pizzeria_name;