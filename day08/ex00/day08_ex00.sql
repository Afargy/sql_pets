-- Session #1
BEGIN    ;

UPDATE    pizzeria
SET       rating = 5
WHERE     NAME = 'Pizza Hut';

-- Session #2
SELECT    *
FROM      pizzeria
WHERE     NAME = 'Pizza Hut';

-- Session #3
COMMIT   ;

-- Session #4 
SELECT    *
FROM      pizzeria
WHERE     NAME = 'Pizza Hut';
