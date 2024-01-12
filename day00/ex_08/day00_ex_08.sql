SELECT    *
FROM      person_order AS po
WHERE     po.id % 2 = 0
ORDER BY  po.id;
