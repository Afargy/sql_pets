SELECT    pv.person_id,
          COUNT(pv.pizzeria_id) AS count_of_visits
FROM      person_visits AS pv
GROUP BY  pv.person_id
ORDER BY  count_of_visits DESC,
          person_id ASC;
