CREATE    SEQUENCE seq_person_discounts START 1;

SELECT    SETVAL(
          'seq_person_discounts',
          (
          SELECT    MAX(id) + 1
          FROM      person_discounts
          )
          );

ALTER     TABLE person_discounts
ALTER     id
SET       DEFAULT CURRVAL('seq_person_discounts');
