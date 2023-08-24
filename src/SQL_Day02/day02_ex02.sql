SELECT COALESCE(p.name, '-') AS person_name,
       pv.visit_date,
       COALESCE(p2.name, '-') AS pizzeria_name
FROM person p
FULL OUTER JOIN (SELECT visit_date, person_id, pizzeria_id
       FROM person_visits
       WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-03')
       AS pv ON p.id = pv.person_id
FULL OUTER JOIN pizzeria p2 ON pv.pizzeria_id = p2.id
ORDER BY person_name, visit_date, pizzeria_name;