WITH      day_generator AS (
          SELECT    GENERATE_SERIES('2022-01-01'::date, '2022-01-10', '1 day')::date AS missing_date
          )
SELECT    missing_date
FROM      day_generator AS dg
LEFT JOIN person_visits AS pv ON (pv.visit_date = dg.missing_date) AND      
          (
          pv.person_id = 1 OR       
          pv.person_id = 2
          )
WHERE     visit_date IS NULL;
