SELECT    m.pizza_name,
          pz.name AS pizzeria_name
FROM      person_order AS po
JOIN      person AS p ON p.id = po.person_id
JOIN      menu AS m ON m.id = po.menu_id
JOIN      pizzeria AS pz ON pz.id = m.pizzeria_id
WHERE     p.name = 'Anna' OR       
          p.name = 'Denis'
ORDER BY  1,
          2;
