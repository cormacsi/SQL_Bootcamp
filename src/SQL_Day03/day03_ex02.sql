SELECT m.pizza_name,
    m.price,
    p.name AS pizzeria_name
FROM menu m
JOIN pizzeria p on m.pizzeria_id = p.id
WHERE m.id NOT IN (SELECT menu_id
                   FROM person_order)
ORDER BY pizza_name, price;