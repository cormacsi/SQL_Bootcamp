-- Session #1
BEGIN TRANSACTION;

-- Session #2
BEGIN TRANSACTION;

-- Session #1
UPDATE pizzeria SET rating = 1.5 WHERE name = 'Pizza Hut';

-- Session #2
UPDATE pizzeria SET rating = 1.5 WHERE name = 'Dominos';

-- Session #1
UPDATE pizzeria SET rating = 2.5 WHERE name = 'Dominos';

-- Session #2
UPDATE pizzeria SET rating = 2.5 WHERE name = 'Pizza Hut';

-- Session #1
COMMIT;

-- Session #2
COMMIT;

-- Session #1
SELECT * FROM pizzeria WHERE id IN(1, 2);

-- Session #2
SELECT * FROM pizzeria WHERE id IN(1, 2);