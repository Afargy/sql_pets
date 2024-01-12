CREATE    FUNCTION fnc_persons_female () RETURNS TABLE (
id BIGINT,
NAME VARCHAR,
age INTEGER,
gender VARCHAR,
address VARCHAR
) AS $$ 
SELECT    *
FROM      person
where gender = 'female';
$$ LANGUAGE SQL;

CREATE    FUNCTION fnc_persons_male () RETURNS TABLE (
id BIGINT,
NAME VARCHAR,
age INTEGER,
gender VARCHAR,
address VARCHAR
) AS $$ 
SELECT    *
FROM      person
where gender = 'male';
$$ LANGUAGE SQL;

SELECT    *
FROM      fnc_persons_female ();

SELECT    *
FROM      fnc_persons_male ();
