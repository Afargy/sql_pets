SELECT    p.name,
          COUNT(pv.person_id) count_of_visits
FROM      person_visits AS pv
JOIN      person AS p ON p.id = pv.person_id
GROUP BY  pv.person_id,
          p.name
HAVING    COUNT(pv.person_id) > 3;
