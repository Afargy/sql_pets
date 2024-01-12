SELECT    p.name
FROM      person_order AS po
JOIN      person AS p ON p.id = po.person_id
JOIN      menu AS m ON m.id = po.menu_id
WHERE     (p.gender = 'male') AND      
          (
          p.address = 'Moscow' OR       
          p.address = 'Samara'
          ) AND      
          (
          m.pizza_name = 'pepperoni pizza' OR       
          m.pizza_name = 'mushroom pizza'
          )
ORDER BY  p.name DESC;
