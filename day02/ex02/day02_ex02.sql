SELECT    COALESCE(p.name, '-') AS person_name,
          pv.visit_date AS visit_date,
          COALESCE(pz.name, '-') AS pizzeria_name
FROM      (
          SELECT    *
          FROM      person_visits
          WHERE     visit_date BETWEEN '2022-01-01' AND '2022-01-03'
          ) AS pv
FULL JOIN pizzeria AS pz ON pz.id = pv.pizzeria_id
FULL JOIN person AS p ON pv.person_id = p.id
ORDER BY  1,
          2,
          3;
