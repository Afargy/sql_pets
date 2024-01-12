DROP      FUNCTION fnc_persons_female;

DROP      FUNCTION fnc_persons_male;

CREATE    FUNCTION fnc_persons (pgender VARCHAR DEFAULT 'female') RETURNS TABLE (
id BIGINT,
NAME VARCHAR,
age INTEGER,
gender VARCHAR,
address VARCHAR
) AS $$ 
SELECT    *
FROM      person
where gender = pgender;
$$ LANGUAGE SQL;

SELECT    *
FROM      fnc_persons (pgender := 'male');

SELECT    *
FROM      fnc_persons ();
