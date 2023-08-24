SELECT name
FROM person p
JOIN person_order po on p.id = po.person_id
JOIN menu m on po.menu_id = m.id
WHERE p.gender = 'male' AND
      p.address IN ('Moscow', 'Samara') AND
      m.pizza_name IN ('pepperoni pizza', 'mushroom pizza')
ORDER BY name DESC;