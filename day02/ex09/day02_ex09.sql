WITH      tmp AS (
          SELECT    *
          FROM      person_order AS po
          JOIN      person AS p ON p.id = po.person_id
          JOIN      menu AS m ON m.id = po.menu_id
          WHERE     p.gender = 'female'
          )
SELECT    t.name
FROM      tmp AS t
WHERE     t.pizza_name = 'pepperoni pizza'
INTERSECT
SELECT    t.name
FROM      tmp AS t
WHERE     t.pizza_name = 'cheese pizza'
ORDER BY  NAME;
