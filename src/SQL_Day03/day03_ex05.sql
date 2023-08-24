SELECT DISTINCT p.name AS pizzeria_name
FROM pizzeria p
JOIN person_visits pv ON p.id = pv.pizzeria_id
JOIN person p2 ON pv.person_id = p2.id AND p2.name = 'Andrey'
EXCEPT
SELECT DISTINCT p3.name AS pizzeria_name
FROM menu m
JOIN person_order po ON m.id = po.menu_id
JOIN pizzeria p3 ON m.pizzeria_id = p3.id
JOIN person p4 ON po.person_id = p4.id AND p4.name = 'Andrey'
ORDER BY pizzeria_name;