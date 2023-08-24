SELECT p.name AS pizzeria_name
FROM person_visits pv
JOIN pizzeria p on pv.pizzeria_id = p.id
JOIN person p2 on pv.person_id = p2.id
JOIN menu m on p.id = m.pizzeria_id
WHERE pv.visit_date = '2022-01-08' AND
      p2.name = 'Dmitriy' AND
      m.price < 800;