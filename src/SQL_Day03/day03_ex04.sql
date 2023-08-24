WITH female AS (SELECT p.name AS pizzeria_name
                FROM person_order po
                JOIN menu m ON po.menu_id = m.id
                JOIN pizzeria p ON m.pizzeria_id = p.id
                JOIN person p2 on po.person_id = p2.id AND p2.gender = 'female'),
    male AS (SELECT p.name AS pizzeria_name
                FROM person_order po
                JOIN menu m ON po.menu_id = m.id
                JOIN pizzeria p ON m.pizzeria_id = p.id
                JOIN person p2 on po.person_id = p2.id AND p2.gender = 'male')
(SELECT *
FROM male
EXCEPT
SELECT *
FROM female)
UNION
(SELECT *
FROM female
EXCEPT
SELECT *
FROM male);