INSERT    INTO person_discounts
SELECT    ROW_NUMBER() OVER () AS id,
          po.person_id,
          m.pizzeria_id,
          CASE COUNT(*)
                    WHEN 1 THEN 10.5
                    WHEN 2 THEN 22
                    ELSE 30
          END AS discount
FROM      person_order AS po
JOIN      menu AS m ON m.id = po.menu_id
GROUP BY  person_id,
          pizzeria_id;
