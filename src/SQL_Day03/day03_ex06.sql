WITH tmp AS (SELECT pizza_name,
                    price,
                    p.id AS pizzeria_id,
                    name AS pizzeria_name
             FROM menu m
             JOIN pizzeria p on m.pizzeria_id = p.id),
    tmp2 AS (SELECT *
             FROM tmp)
SELECT tmp.pizza_name,
       tmp.pizzeria_name AS pizzeria_name_1,
       tmp2.pizzeria_name AS pizzeria_name_2,
       tmp.price
FROM tmp
JOIN tmp2 on tmp.price = tmp2.price AND
             tmp.pizza_name = tmp2.pizza_name AND
             tmp.pizzeria_id > tmp2.pizzeria_id
ORDER BY pizza_name;