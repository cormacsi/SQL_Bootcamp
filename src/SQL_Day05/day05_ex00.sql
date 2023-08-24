DROP INDEX IF EXISTS idx_menu_pizzeria_id,
                     idx_person_order_person_id,
                     idx_person_order_menu_id,
                     idx_person_visits_person_id,
                     idx_person_visits_pizzeria_id;

CREATE INDEX idx_menu_pizzeria_id on menu(pizzeria_id);
CREATE INDEX idx_person_order_person_id on person_order(person_id);
CREATE INDEX idx_person_order_menu_id on person_order(menu_id);
CREATE INDEX idx_person_visits_person_id on person_visits(person_id);
CREATE INDEX idx_person_visits_pizzeria_id on person_visits(pizzeria_id);