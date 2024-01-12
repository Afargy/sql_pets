SELECT    (
          SELECT    ps.name
          FROM      person AS ps
          WHERE     id = pv.person_id
          ) AS person_name,
          (
          SELECT    pz.name
          FROM      pizzeria AS pz
          WHERE     id = pv.pizzeria_id
          ) AS pzeeria_name
FROM      (
          SELECT    pv.person_id,
                    pv.pizzeria_id
          FROM      person_visits AS pv
          WHERE     visit_date BETWEEN '2022-01-07' AND '2022-01-09'
          ) AS pv
ORDER BY  person_name ASC;
