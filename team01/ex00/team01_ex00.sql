WITH      c AS (
          SELECT    c.id,
                    c."name",
                    c.rate_to_usd
          FROM      (
                    SELECT    id,
                              MAX(updated)
                    FROM      currency
                    GROUP BY  id
                    ) AS f
          JOIN      currency AS c ON c.id = f.id AND      
                    c.updated = f.max
          )
SELECT    COALESCE(u.name, 'not defined') AS NAME,
          COALESCE(u.lastname, 'not defined') AS lastname,
          b.type AS "type",
          SUM(b.money) AS volume,
          COALESCE(c.name, 'not defined') AS currency_name,
          COALESCE(c.rate_to_usd, 1) AS last_rate_to_usd,
          SUM(COALESCE(b.money, 1)) * COALESCE(rate_to_usd, 1) AS total_volume_in_usd
FROM      "user" AS u
FULL JOIN balance AS b ON b.user_id = u.id
FULL JOIN c ON b.currency_id = c.id
GROUP BY  u.name,
          u.lastname,
          b.type,
          currency_name,
          c.rate_to_usd
ORDER BY  "name" DESC,
          lastname,
          "type";
