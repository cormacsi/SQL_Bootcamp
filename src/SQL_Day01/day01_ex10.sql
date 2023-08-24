SELECT p.name AS person_name,
       pizza_name,
       p2.name AS pizzeria_name
FROM person_order
JOIN person p on person_order.person_id = p.id
JOIN menu m on person_order.menu_id = m.id
JOIN pizzeria p2 on m.pizzeria_id = p2.id
ORDER BY person_name, pizza_name, pizzeria_name;