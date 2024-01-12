WITH      e1 AS (
          SELECT    m.id AS menu_id
          FROM      menu AS m
          EXCEPT   
          SELECT    po.menu_id
          FROM      person_order AS po
          ORDER BY  1
          )
SELECT    m.pizza_name,
          m.price,
          pz.name
FROM      e1
JOIN      menu AS m ON m.id = e1.menu_id
JOIN      pizzeria AS pz ON pz.id = m.pizzeria_id
ORDER BY  m.pizza_name,
          m.price;
