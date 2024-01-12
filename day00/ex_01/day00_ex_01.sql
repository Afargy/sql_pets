SELECT    ps.name,
          ps.age
FROM      person AS ps
WHERE     ps.address = 'Kazan' AND      
          ps.gender = 'female'
ORDER BY  ps.name;
