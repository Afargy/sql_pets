SELECT    p.name AS person_name,
          m.pizza_name AS pizzeria_name,
          pz.name AS pizza_name
FROM      pizzeria AS pz
JOIN      menu AS m ON m.pizzeria_id = pz.id
JOIN      person_order AS po ON po.menu_id = m.id
JOIN      person AS p ON p.id = po.person_id
ORDER BY  person_name ASC,
          pizza_name ASC,
          pizzeria_name ASC;
