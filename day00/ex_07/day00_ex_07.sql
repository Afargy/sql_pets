SELECT    ps.id,
          ps.name,
          CASE
                    WHEN (
                    ps.age >= 10 AND      
                    ps.age <= 20
                    ) THEN 'interval #1'
                    WHEN (
                    ps.age > 20 AND      
                    ps.age < 24
                    ) THEN 'interval #2'
                    ELSE 'interval #3'
          END AS interval_info
FROM      person AS ps
ORDER BY  interval_info
