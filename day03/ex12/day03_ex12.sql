INSERT    INTO person_order
VALUES    (
          GENERATE_SERIES(
          (
          SELECT    MAX(po.id)
          FROM      person_order AS po
          ) + 1,
          (
          SELECT    MAX(po.id)
          FROM      person_order AS po
          ) + (
          SELECT    COUNT(*)
          FROM      person
          )
          ),
          GENERATE_SERIES(
          (
          SELECT    MIN(p.id)
          FROM      person AS p
          ),
          (
          SELECT    MAX(p.id)
          FROM      person AS p
          )
          ),
          (
          SELECT    m.id
          FROM      menu AS m
          WHERE     m.pizza_name = 'greek pizza'
          ),
          '2022-02-25'
          );
