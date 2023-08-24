WITH visits AS (SELECT p2.name, count(*) AS count
               FROM person_visits
               INNER JOIN pizzeria p2 on p2.id = person_visits.pizzeria_id
               GROUP BY p2.name),
     orders AS (SELECT p.name, count(*) AS count
                FROM person_order
                INNER JOIN menu m on m.id = person_order.menu_id
                INNER JOIN pizzeria p on p.id = m.pizzeria_id
                GROUP BY p.name)
SELECT pizzeria.name,
       coalesce(orders.count, 0) + coalesce(visits.count, 0) AS total_count
FROM pizzeria
LEFT JOIN orders on orders.name = pizzeria.name
LEFT JOIN visits on visits.name = pizzeria.name
ORDER BY total_count DESC, name;