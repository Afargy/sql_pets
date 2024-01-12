WITH      t AS (
          SELECT    p.address,
                    MAX(p.age)::NUMERIC - (MIN(p.age)::NUMERIC / MAX(p.age))::NUMERIC AS formula,
                    AVG(p.age) AS average
          FROM      person AS p
          GROUP BY  p.address
          ORDER BY  p.address
          )
SELECT    t.address,
          ROUND(t.formula, 2),
          ROUND(t.average, 2),
          formula > average AS comparison
FROM      t
ORDER BY  t.address;
