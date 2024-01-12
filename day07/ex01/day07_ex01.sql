SELECT    p.name,
          COUNT(pv.pizzeria_id) AS count_of_visits
FROM      person_visits AS pv
JOIN      person AS p ON p.id = pv.person_id
GROUP BY  pv.person_id,
          p.name
ORDER BY  count_of_visits DESC,
          p.name
LIMIT     4;
