WITH      wn AS (
          SELECT    p.id
          FROM      person AS p
          WHERE     p.name = 'Dmitriy'
          ),
          wp AS (
          SELECT    m.pizzeria_id
          FROM      menu AS m
          WHERE     m.price < 800
          EXCEPT   
          SELECT    pz.id
          FROM      person_visits AS pv
          JOIN      person AS p ON p.id = pv.person_id
          JOIN      pizzeria AS pz ON pz.id = pv.pizzeria_id
          JOIN      menu AS m ON m.pizzeria_id = pv.pizzeria_id
          WHERE     pv.visit_date = '2022-01-08' AND      
                    p.name = 'Dmitriy' AND      
                    m.price < 800
          LIMIT     1
          )
INSERT    INTO person_visits
VALUES    (
          (
          SELECT    MAX(pv.id) + 1
          FROM      person_visits AS pv
          ),
          (
          SELECT    *
          FROM      wn
          ),
          (
          SELECT    *
          FROM      wp
          ),
          '2022-01-08'
          );

REFRESH   MATERIALIZED VIEW mv_dmitriy_visits_and_eats;
