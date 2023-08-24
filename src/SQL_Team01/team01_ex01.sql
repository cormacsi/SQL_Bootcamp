insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

-- Version with function

CREATE OR REPLACE FUNCTION func_nearest_currency_rate
    (pcurrency_id integer,
    pupdated timestamp)
RETURNS numeric
AS $$
    DECLARE
        nearest_date timestamp := NULL;
    BEGIN
        IF (EXISTS (
                SELECT *
                FROM currency AS c
                WHERE c.id = pcurrency_id
                AND c.updated < pupdated
                )) THEN
            nearest_date := (
                SELECT max (c.updated)
                FROM currency AS c
                WHERE c.id = pcurrency_id
                AND c.updated < pupdated
            );
        ELSE
            nearest_date := (
                SELECT min (c.updated)
                FROM currency AS c
                WHERE c.id = pcurrency_id
                AND c.updated > pupdated
            );
        END IF;

        RETURN (
            SELECT c.rate_to_usd
                FROM currency AS c
                WHERE c.id = pcurrency_id
                AND c.updated = nearest_date
            LIMIT 1
        );
    END;
$$ LANGUAGE plpgsql;

SELECT COALESCE(u.name, 'not defined') AS name,
       COALESCE(u.lastname, 'not defined') AS lastname,
       (
        SELECT c.name
        FROM currency AS c
        WHERE c.id = b.currency_id
        LIMIT 1
       ) AS currency_name,
       b.money * func_nearest_currency_rate (b.currency_id, b.updated) AS currency_in_usd
FROM balance AS b
LEFT JOIN "user" AS u ON b.user_id = u.id
WHERE b.currency_id IN (
                        SELECT c.id
                        FROM currency AS c
                        )
ORDER BY    1 DESC,
            2 ASC,
            3 ASC;

-- Version without function

SELECT COALESCE(u.name, 'not defined') AS name,
       COALESCE(u.lastname, 'not defined') AS lastname,
        (
            SELECT c.name
            FROM currency AS c
            WHERE c.id = b.currency_id
            LIMIT 1
        ) AS currency_name,
        (
            SELECT c.rate_to_usd
            FROM currency AS c
            WHERE c.id = b.currency_id
            AND c.updated = COALESCE(
                (
                    SELECT max (c.updated)
                    FROM currency AS c
                    WHERE c.id = b.currency_id
                    AND c.updated < b.updated
                ),
                (
                    SELECT min (c.updated)
                    FROM currency AS c
                    WHERE c.id = b.currency_id
                    AND c.updated > b.updated
                ))
            LIMIT 1
        ) * b.money AS currency_in_usd
FROM balance AS b
LEFT JOIN "user" AS u ON b.user_id = u.id
WHERE b.currency_id IN (
                        SELECT c.id
                        FROM currency AS c
                        )
ORDER BY    1 DESC,
            2 ASC,
            3 ASC;