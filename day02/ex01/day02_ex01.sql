SELECT    missing_date::date
FROM      GENERATE_SERIES('2022-01-01'::date, '2022-01-10', '1 day') AS missing_date
LEFT JOIN person_visits AS pv ON (pv.visit_date = missing_date.missing_date) AND      
          (
          pv.person_id = 1 OR       
          pv.person_id = 2
          )
WHERE     visit_date IS NULL
ORDER BY  missing_date;
