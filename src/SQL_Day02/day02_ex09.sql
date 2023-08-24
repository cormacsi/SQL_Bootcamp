SELECT name
FROM person p
JOIN person_order po on p.id = po.person_id
JOIN menu m on m.id = po.menu_id
WHERE p.gender = 'female' AND
      (pizza_name = 'pepperoni pizza' OR
      pizza_name = 'cheese pizza')
GROUP BY name
HAVING COUNT(DISTINCT pizza_name) = 2
ORDER BY name;