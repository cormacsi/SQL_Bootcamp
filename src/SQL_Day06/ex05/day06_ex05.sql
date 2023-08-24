COMMENT ON TABLE person_discounts IS 'Personal discounts table';
COMMENT ON COLUMN person_discounts.id IS 'Primary id';
COMMENT ON COLUMN person_discounts.person_id IS 'Each person''s identifier';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'Each pizzeria''s identifier';
COMMENT ON COLUMN person_discounts.discount IS 'Discount price for a certain person for one pizzeria';