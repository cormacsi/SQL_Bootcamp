DROP INDEX IF EXISTS idx_person_name;
CREATE INDEX idx_person_name on person(UPPER(name));

SET enable_seqscan = OFF;
EXPLAIN ANALYZE
SELECT id, name
FROM person
WHERE UPPER(name) IN('NATALY', 'PETER');