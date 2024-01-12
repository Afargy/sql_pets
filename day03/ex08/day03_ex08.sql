INSERT    INTO menu
VALUES    (
          (
          SELECT    MAX(m.id) + 1
          FROM      menu AS m
          ),
          (
          SELECT    pz.id
          FROM      pizzeria AS pz
          WHERE     pz.name = 'Dominos'
          ),
          'sicilian pizza',
          900
          );
