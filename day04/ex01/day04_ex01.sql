SELECT    f.name
FROM      v_persons_female AS f
UNION    
SELECT    m.name
FROM      v_persons_male AS m
ORDER BY  NAME;
