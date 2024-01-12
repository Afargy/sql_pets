DROP      FUNCTION fnc_person_visits_and_eats_on_date;

CREATE    FUNCTION fnc_person_visits_and_eats_on_date (
pperson VARCHAR DEFAULT 'Dmitriy',
pprice NUMERIC DEFAULT 500,
pdate DATE DEFAULT '2022-01-08'
) RETURNS TABLE (NAME VARCHAR) AS $$
  begin
    RETURN QUERY
    SELECT    pz.name 
    FROM      person_visits AS pv
    JOIN      person AS p ON p.id = pv.person_id
    JOIN      menu AS m ON m.pizzeria_id = pv.pizzeria_id
    JOIN      pizzeria AS pz ON pz.id = pv.pizzeria_id
    WHERE     p.name = pperson AND      
              pv.visit_date = pdate AND      
              m.price < pprice;
  END;
$$ LANGUAGE plpgsql;

SELECT    *
FROM      fnc_person_visits_and_eats_on_date (pprice := 800);

SELECT    *
FROM      fnc_person_visits_and_eats_on_date (pperson := 'Anna', pprice := 1300, pdate := '2022-01-01');
