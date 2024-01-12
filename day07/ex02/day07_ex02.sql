(
SELECT    pz.name,
          COUNT(*),
          'order' AS action_type
FROM      person_order AS po
JOIN      menu AS m ON m.id = po.menu_id
JOIN      pizzeria AS pz ON pz.id = m.pizzeria_id
GROUP BY  pizzeria_id,
          pz.name
ORDER BY  COUNT DESC
LIMIT     3
)
UNION ALL
(
SELECT    pz.name,
          COUNT(*),
          'visit' AS action_type
FROM      person_visits AS pv
JOIN      pizzeria AS pz ON pz.id = pv.pizzeria_id
GROUP BY  pizzeria_id,
          pz.name
ORDER BY  COUNT DESC
LIMIT     3
);
