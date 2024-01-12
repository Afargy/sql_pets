WITH      p AS (
          SELECT    *
          FROM      person
          )
SELECT    p1.name AS person_name1,
          p2.name AS person_name2,
          p1.address AS common_address
FROM      p AS p1
JOIN      p AS p2 ON p2.address = p1.address
WHERE     p1.id > p2.id
ORDER BY  1,
          2,
          3;
