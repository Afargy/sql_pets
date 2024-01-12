COMMENT   ON TABLE person_discounts IS 'Discounts for customers in diffrent pizzerias';

COMMENT   ON COLUMN person_discounts.id IS 'Key column';

COMMENT   ON COLUMN person_discounts.person_id IS 'Foreign key on person table';

COMMENT   ON COLUMN person_discounts.pizzeria_id IS 'Foreign key on pizzeria table';

COMMENT   ON COLUMN person_discounts.discount IS 'Discount value in percents';
