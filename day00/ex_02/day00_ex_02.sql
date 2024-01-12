SELECT    pz.name,
          pz.rating
FROM      pizzeria AS pz
WHERE     (pz.rating >= 3.5) AND      
          (pz.rating <= 5)
ORDER BY  pz.rating;

SELECT    pz.name,
          pz.rating
FROM      pizzeria AS pz
WHERE     pz.rating BETWEEN 3.5 AND 5
ORDER BY  pz.rating;
