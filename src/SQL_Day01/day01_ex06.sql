SELECT order_date AS action_date,
       (SELECT name
        FROM person
        WHERE person_id = person.id
        ) as PERSON_NAME
FROM person_order
INTERSECT
SELECT visit_date AS action_date,
       (SELECT name
        FROM person
        WHERE person_id = person.id
        ) as PERSON_NAME
FROM person_visits
ORDER BY action_date,
         person_name DESC;

SELECT order_date AS action_date,
        name as person_name
FROM person_order
JOIN person p on person_order.person_id = p.id
INTERSECT
SELECT visit_date AS action_date,
       name as person_name
FROM person_visits
JOIN person p on person_visits.person_id = p.id
ORDER BY action_date,
         person_name DESC;