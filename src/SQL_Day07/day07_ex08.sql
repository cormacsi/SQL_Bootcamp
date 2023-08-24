SELECT p.address,
       p2.name,
       count(*) count_of_orders
FROM person_order po
JOIN person p on po.person_id = p.id
JOIN menu m on po.menu_id = m.id
JOIN pizzeria p2 on m.pizzeria_id = p2.id
GROUP BY p.address, p2.name
ORDER BY address, name;