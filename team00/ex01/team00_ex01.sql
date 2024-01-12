WITH      RECURSIVE r AS (
          SELECT    CONCAT(point1, ',', point2) AS point1,
                    point2,
                    COST,
                    1 AS counter
          FROM      tour
          WHERE     point1 = 'a'
          UNION ALL
          SELECT    CONCAT(r.point1, ',', t.point2),
                    t.point2,
                    r.cost + t.cost,
                    r.counter + 1 AS counter
          FROM      tour AS t
          JOIN      r ON r.point2 = t.point1 AND      
                    r.point1 NOT LIKE CONCAT('%', t.point2, '%')
          WHERE     counter < 3
          ),
          rr AS (
          SELECT    CONCAT(r.point1, ',', t.point2) AS point1,
                    r.cost + t.cost AS COST,
                    counter
          FROM      tour AS t
          JOIN      r ON r.point2 = t.point1 AND      
                    t.point2 = 'a'
          WHERE     counter = (
                    SELECT    MAX(counter)
                    FROM      r
                    )
          )
SELECT    COST AS total_cost,
          CONCAT('{', point1, '}') AS tour
FROM      rr
ORDER BY  total_cost,
          tour;
