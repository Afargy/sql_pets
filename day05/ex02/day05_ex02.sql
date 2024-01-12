CREATE    INDEX idx_person_name ON person (NAME);

SET       enable_seqscan TO OFF;

EXPLAIN  
ANALYZE  
SELECT    UPPER(NAME)
FROM      person;
