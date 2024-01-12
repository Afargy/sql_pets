SELECT    (
          SELECT    ps.name
          FROM      person AS ps
          WHERE     ps.id = po.person_id
          ) AS NAME,
          CASE
                    WHEN (
                    SELECT    ps.name
                    FROM      person AS ps
                    WHERE     ps.id = po.person_id
                    ) = 'Denis' THEN TRUE
                    ELSE FALSE
          END AS check_name
FROM      person_order AS po
WHERE     (po.order_date = '2022-01-07') AND      
          (
          po.menu_id = 13 OR       
          po.menu_id = 14 OR       
          po.menu_id = 18
          );
