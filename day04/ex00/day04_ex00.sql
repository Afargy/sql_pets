CREATE    VIEW v_persons_female AS
SELECT    *
FROM      person AS p
WHERE     gender = 'female';

CREATE    VIEW v_persons_male AS
SELECT    *
FROM      person AS p
WHERE     gender = 'male';
