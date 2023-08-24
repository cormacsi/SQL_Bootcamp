WITH female AS (SELECT p.name AS pizzeria_name
                FROM pizzeria p
                JOIN person_visits pv on p.id = pv.pizzeria_id
                JOIN person p2 on pv.person_id = p2.id AND p2.gender = 'female'),
    male AS (SELECT p.name AS pizzeria_name
                FROM pizzeria p
                JOIN person_visits pv on p.id = pv.pizzeria_id
                JOIN person p2 on pv.person_id = p2.id AND p2.gender = 'male')
(SELECT *
FROM male
EXCEPT ALL
SELECT *
FROM female)
UNION ALL
(SELECT *
FROM female
EXCEPT ALL
SELECT *
FROM male)
ORDER BY pizzeria_name;