CREATE    VIEW v_price_with_discount AS
SELECT    p.name,
          m.pizza_name,
          m.price,
          ROUND(price * 0.9) AS discount_price
FROM      person_order AS po
JOIN      menu AS m ON m.id = po.menu_id
JOIN      person AS p ON p.id = po.person_id
ORDER BY  p.name,
          m.pizza_name;
