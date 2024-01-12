CREATE    INDEX idx_person_discounts_unique ON person_discounts (person_id, pizzeria_id);

SET       enable_seqscan TO OFF;

EXPLAIN  
ANALYZE  
SELECT    *
FROM      person_discounts AS pd
ORDER BY  pd.person_id,
          pd.pizzeria_id;
