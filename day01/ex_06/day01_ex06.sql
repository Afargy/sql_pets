SELECT    po.order_date AS action_date,
          (
          SELECT    p.name
          FROM      person AS p
          WHERE     po.person_id = p.id
          ) person_name
FROM      person_order AS po
INTERSECT
SELECT    pv.visit_date AS action_date,
          (
          SELECT    p.name
          FROM      person AS p
          WHERE     pv.person_id = p.id
          ) person_name
FROM      person_visits AS pv
ORDER BY  action_date ASC,
          person_name DESC;
