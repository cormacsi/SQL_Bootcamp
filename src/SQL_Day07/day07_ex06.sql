SELECT p.name,
       count(*) AS count_of_orders,
       round(avg(m.price),2) AS average_price,
       MAX(price) AS max_price,
       MIN(price) AS min_price
FROM person_order po
JOIN menu m on po.menu_id = m.id
JOIN pizzeria p on m.pizzeria_id = p.id
GROUP BY p.name
ORDER BY name;