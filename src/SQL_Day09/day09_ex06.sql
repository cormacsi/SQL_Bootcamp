DROP FUNCTION IF EXISTS fnc_person_visits_and_eats_on_date();

CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(pperson VARCHAR DEFAULT 'Dmitriy',
                                                              pprice NUMERIC DEFAULT 500,
                                                              pdate DATE DEFAULT '2022-01-08')
RETURNS TABLE(name VARCHAR) AS $$
BEGIN
    RETURN QUERY
        SELECT p.name AS pizzeria_name
        FROM pizzeria p
        INNER JOIN person_visits pv on p.id = pv.pizzeria_id AND visit_date = pdate
        INNER JOIN person p2 on p2.id = pv.person_id AND p2.name = pperson
        INNER JOIN menu m on p.id = m.pizzeria_id AND price < pprice;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM fnc_person_visits_and_eats_on_date(pprice := 800);
SELECT * FROM fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');