SET enable_seqscan = OFF;
EXPLAIN ANALYZE
SELECT pizza_name,
       p.name AS pizzeria_name
FROM menu
JOIN pizzeria p on p.id = menu.pizzeria_id;