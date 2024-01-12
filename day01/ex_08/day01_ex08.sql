SELECT    po.order_date,
          CONCAT(p.name, '(age:', p.age, ')') AS person_information
FROM      person_order AS po
NATURAL   JOIN (
          SELECT    p.id AS person_id,
                    p.age,
                    p.name
          FROM      person AS p
          ) AS p
ORDER BY  order_date ASC,
          person_information ASC;
