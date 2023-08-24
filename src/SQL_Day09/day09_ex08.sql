DROP FUNCTION IF EXISTS fnc_fibonacci();

CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop INTEGER DEFAULT 10)
RETURNS TABLE (fibonacci BIGINT) AS $$
    BEGIN
        RETURN QUERY
            WITH RECURSIVE num AS (
                SELECT 0::BIGINT AS first,
                       1::BIGINT AS second
                UNION ALL
                SELECT second AS first,
                       first + second AS second
                FROM num
                WHERE second < pstop)
            SELECT first
            FROM num;
    END; $$
LANGUAGE plpgsql;

SELECT * FROM fnc_fibonacci(100);
SELECT * FROM fnc_fibonacci();