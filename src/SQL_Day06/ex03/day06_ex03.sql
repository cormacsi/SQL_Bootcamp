CREATE UNIQUE INDEX idx_person_discounts_unique
    on person_discounts(person_id, pizzeria_id);

SET enable_seqscan = OFF;
EXPLAIN ANALYZE
SELECT *
FROM person_discounts
WHERE person_id IN(4,5) AND
      pizzeria_id = 6;