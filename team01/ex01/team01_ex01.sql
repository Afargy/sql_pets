INSERT    INTO currency
VALUES    (100, 'EUR', 0.85, '2022-01-01 13:29');

INSERT    INTO currency
VALUES    (100, 'EUR', 0.79, '2022-01-08 13:29');

WITH      b AS (
          SELECT    user_id,
                    currency_id,
                    CASE
                              WHEN (
                              SELECT    MAX(c.updated)
                              FROM      currency AS c
                              WHERE     b.currency_id = c.id AND      
                                        c.updated <= b.updated
                              ) IS NOT NULL THEN (
                              SELECT    MAX(c.updated)
                              FROM      currency AS c
                              WHERE     b.currency_id = c.id AND      
                                        c.updated <= b.updated
                              )
                              ELSE (
                              SELECT    MIN(c.updated)
                              FROM      currency AS c
                              WHERE     b.currency_id = c.id AND      
                                        c.updated > b.updated
                              )
                    END AS updated,
                    "money"
          FROM      balance AS b
          )
SELECT    COALESCE(u.name, 'not defined') AS "name",
          COALESCE(lastname, 'not defined') AS lastname,
          c.name AS currency_name,
          b.money * rate_to_usd AS currency_in_usd
FROM      b
JOIN      currency AS c ON c.updated = b.updated AND      
          b.currency_id = c.id
LEFT JOIN "user" AS u ON b.user_id = u.id
ORDER BY  "name" DESC,
          lastname ASC,
          currency_name ASC;
