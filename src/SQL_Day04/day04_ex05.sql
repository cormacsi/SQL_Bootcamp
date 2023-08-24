CREATE OR REPLACE VIEW v_price_with_discount AS
SELECT p.name,
       m.pizza_name,
       m.price,
       ROUND(m.price - m.price * 0.1)::integer AS discount_price
FROM person_order po
JOIN person p on po.person_id = p.id
JOIN menu m on po.menu_id = m.id
ORDER BY name, pizza_name;