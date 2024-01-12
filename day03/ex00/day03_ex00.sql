SELECT    m.pizza_name,
          m.price,
          pz.name,
          pv.visit_date
FROM      person_visits AS pv
JOIN      person AS p ON p.id = pv.person_id AND      
          p.name = 'Kate'
JOIN      pizzeria AS pz ON pz.id = pv.pizzeria_id
JOIN      menu AS m ON m.pizzeria_id = pz.id AND      
          m.price >= 800 AND      
          m.price <= 1000
ORDER BY  1,
          2,
          3;
