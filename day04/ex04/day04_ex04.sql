CREATE    VIEW v_symmetric_union AS
WITH      R AS (
          SELECT    pv.person_id
          FROM      person_visits AS pv
          WHERE     visit_date = '2022-01-02'
          ),
          S AS (
          SELECT    pv.person_id
          FROM      person_visits AS pv
          WHERE     visit_date = '2022-01-06'
          ) (
          SELECT    *
          FROM      R
          UNION ALL
          SELECT    *
          FROM      S
          )
EXCEPT   
(
SELECT    *
FROM      R
INTERSECT
SELECT    *
FROM      S
)
ORDER BY  person_id;
