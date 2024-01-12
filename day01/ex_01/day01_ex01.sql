(
SELECT    p.name AS object_name
FROM      person AS p
ORDER BY  object_name
)
UNION ALL
(
SELECT    m.pizza_name AS object_name
FROM      menu AS m
ORDER BY  object_name
);
