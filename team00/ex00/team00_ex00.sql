CREATE    TABLE tour (point1 VARCHAR, point2 VARCHAR, COST INTEGER);

INSERT    INTO tour
VALUES    ('a', 'b', 10),
          ('b', 'a', 10),
          ('a', 'c', 15),
          ('c', 'a', 15),
          ('a', 'd', 20),
          ('d', 'a', 20),
          ('b', 'c', 35),
          ('c', 'b', 35),
          ('b', 'd', 25),
          ('d', 'b', 25),
          ('d', 'c', 30),
          ('c', 'd', 30);

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
WHERE     COST = (
          SELECT    MIN(COST)
          FROM      rr
          )
ORDER BY  total_cost,
          tour;
