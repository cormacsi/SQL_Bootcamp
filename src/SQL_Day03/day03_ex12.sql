INSERT INTO person_order (id, person_id, menu_id, order_date)
SELECT (SELECT MAX(id) FROM person_order) + p_id AS id,
        id AS person_id,
        (SELECT id FROM menu WHERE pizza_name = 'greek pizza') AS menu_id,
        '2022-02-25' AS order_date
FROM generate_series(1, (SELECT COUNT(*) FROM PERSON)) AS p_id
INNER JOIN person ON p_id = person.id;

-- DELETE FROM person_order WHERE order_date = '2022-02-25';