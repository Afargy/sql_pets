WITH      o AS (
          SELECT    pz.name,
                    p.gender
          FROM      person_order AS po
          JOIN      person AS p ON p.id = po.person_id
          JOIN      menu AS m ON m.id = po.menu_id
          JOIN      pizzeria AS pz ON pz.id = m.pizzeria_id
          ),
          m AS (
          SELECT    o.name
          FROM      o
          WHERE     o.gender = 'male'
          ),
          f AS (
          SELECT    o.name
          FROM      o
          WHERE     o.gender = 'female'
          )
SELECT    *
FROM      m
UNION    
SELECT    *
FROM      f
EXCEPT   
(
SELECT    *
FROM      f
INTERSECT
SELECT    *
FROM      m
)
