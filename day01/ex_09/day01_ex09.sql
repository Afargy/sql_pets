SELECT    pz.name
FROM      pizzeria AS pz
WHERE     pz.id NOT IN (
          SELECT    pv.pizzeria_id
          FROM      person_visits AS pv
          );

SELECT    pz.name
FROM      pizzeria AS pz
WHERE     NOT EXISTS (
          SELECT    pizzeria_id
          FROM      person_visits AS pv
          WHERE     pv.pizzeria_id = pz.id
          );
