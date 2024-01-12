SELECT    pz.name,
          COUNT(m.pizzeria_id) AS count_of_orders,
          ROUND(AVG(price), 2) AS average_price,
          MAX(price) AS max_price,
          MIN(price) AS min_price
FROM      person_order AS po
JOIN      menu AS m ON m.id = po.menu_id
JOIN      pizzeria AS pz ON pz.id = m.pizzeria_id
GROUP BY  m.pizzeria_id,
          pz.name
ORDER BY  pz.name;
