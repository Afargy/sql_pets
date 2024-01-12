SELECT    pz.name AS pizzeria_name
FROM      person_visits AS pv
JOIN      person AS p ON p.id = pv.person_id
JOIN      pizzeria AS pz ON pz.id = pv.pizzeria_id
JOIN      menu AS m ON m.pizzeria_id = pv.pizzeria_id
WHERE     pv.visit_date = '2022-01-08' AND      
          p.name = 'Dmitriy' AND      
          m.price < 800;
