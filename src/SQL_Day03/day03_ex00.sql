SELECT m.pizza_name,
       m.price,
       p.name AS pizzeria_name,
       pv.visit_date
FROM person_visits pv
JOIN pizzeria p on pv.pizzeria_id = p.id
JOIN menu m on p.id = m.pizzeria_id AND m.price BETWEEN 800 and 1000
JOIN person p2 on pv.person_id = p2.id AND p2.name = 'Kate'
ORDER BY pizza_name, price, pizzeria_name;