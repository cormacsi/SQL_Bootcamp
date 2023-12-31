DROP FUNCTION IF EXISTS func_minimum();

CREATE OR REPLACE FUNCTION func_minimum(VARIADIC arr NUMERIC[])
RETURNS NUMERIC AS $$
    BEGIN
        RETURN (SELECT min(i) FROM unnest(arr) i);
    END; $$
LANGUAGE plpgsql;

SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);