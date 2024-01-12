SELECT    s.name,
          SUM(COUNT) AS total_count
FROM      (
          (
          SELECT    pz.name,
                    COUNT(m.pizzeria_id)
          FROM      person_order AS po
          JOIN      menu AS m ON m.id = po.menu_id
          JOIN      pizzeria AS pz ON pz.id = m.pizzeria_id
          GROUP BY  m.pizzeria_id,
                    pz.name
          )
          UNION ALL
          (
          SELECT    pz.name,
                    COUNT(*)
          FROM      person_visits AS pv
          JOIN      pizzeria AS pz ON pz.id = pv.pizzeria_id
          GROUP BY  pv.pizzeria_id,
                    pz.name
          )
          ) AS s
GROUP BY  s.name
ORDER BY  total_count DESC,
          NAME ASC;
