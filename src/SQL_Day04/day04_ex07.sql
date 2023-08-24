INSERT INTO person_visits (id, person_id, pizzeria_id, visit_date)
VALUES ((SELECT MAX(id) FROM person_visits) + 1,
        (SELECT id FROM person WHERE name = 'Dmitriy'),
        (SELECT MIN(p.id)
         FROM pizzeria p
         JOIN menu m on p.id = m.pizzeria_id AND price < 800
         WHERE p.name NOT IN (SELECT * FROM mv_dmitriy_visits_and_eats)),
        '2022-01-08');

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;

-- DELETE FROM person_visits WHERE id IN (20, 21);