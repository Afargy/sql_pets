WITH      s AS (
          SELECT    m.id,
                    m.pizza_name,
                    m.price,
                    pz.name
          FROM      menu AS m
          JOIN      pizzeria AS pz ON pz.id = m.pizzeria_id
          )
SELECT    s1.pizza_name AS pizza_name,
          s1.name AS pizzeria_name_1,
          s2.name AS pizzeria_name_2,
          s1.price AS price
FROM      s AS s1
JOIN      s AS s2 ON s1.pizza_name = s2.pizza_name AND      
          s1.price = s2.price
WHERE     s1.id > s2.id
ORDER BY  s1.pizza_name;
