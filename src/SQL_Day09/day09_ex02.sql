DELETE FROM person_audit WHERE type_event = 'D';
DROP TRIGGER IF EXISTS trg_person_delete_audit ON person;
DROP FUNCTION IF EXISTS fnc_trg_person_delete_audit();

CREATE OR REPLACE FUNCTION fnc_trg_person_delete_audit()
RETURNS TRIGGER AS $$
    BEGIN
        INSERT INTO person_audit(created, type_event, row_id, name, age, gender, address)
        VALUES (current_timestamp, 'D', OLD.id, OLD.name, OLD.age, OLD.gender, OLD.address);
        RETURN NULL;
    END; $$
LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER trg_person_delete_audit
    AFTER DELETE ON person FOR EACH ROW
EXECUTE PROCEDURE fnc_trg_person_delete_audit();

DELETE FROM person WHERE id = 10;

SELECT * FROM person_audit;