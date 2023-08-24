SELECT p.name,
       m.pizza_name,
       m.price,
       m.price - (pd.discount * m.price / 100) AS discount_price,
       p2.name AS pizzeria_name
FROM person_order po
INNER JOIN person p on p.id = po.person_id
INNER JOIN menu m on m.id = po.menu_id
INNER JOIN person_discounts pd on p.id = pd.person_id AND m.pizzeria_id = pd.pizzeria_id
INNER JOIN pizzeria p2 on m.pizzeria_id = p2.id
ORDER BY name, pizza_name;