WITH      v AS (
          SELECT    pz.name,
                    p.gender
          FROM      person_visits AS pv
          JOIN      person AS p ON p.id = pv.person_id
          JOIN      pizzeria AS pz ON pz.id = pv.pizzeria_id
          ),
          f AS (
          SELECT    v.name
          FROM      v
          WHERE     gender = 'female'
          ),
          m AS (
          SELECT    v.name
          FROM      v
          WHERE     gender = 'male'
          )
SELECT    *
FROM      m
EXCEPT    ALL
SELECT    *
FROM      f
UNION ALL
(
SELECT    *
FROM      f
EXCEPT    ALL
SELECT    *
FROM      m
)
ORDER BY  NAME;
