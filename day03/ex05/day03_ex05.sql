SELECT    pz.name
FROM      (
          SELECT    pv.pizzeria_id
          FROM      person_visits AS pv
          JOIN      person AS p ON p.id = pv.person_id AND      
                    p.name = 'Andrey'
          EXCEPT   
          SELECT    m.pizzeria_id
          FROM      person_order AS po
          JOIN      menu AS m ON m.id = po.menu_id
          JOIN      person AS p ON p.id = po.person_id AND      
                    p.name = 'Andrey'
          ) AS s
JOIN      pizzeria AS pz ON pz.id = s.pizzeria_id
ORDER BY  1;
