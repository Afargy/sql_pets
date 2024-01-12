-- Session #1 then session #2
BEGIN    ;

SET       TRANSACTION ISOLATION LEVEL REPEATABLE READ;

-- Session #1 then session #2
SELECT    *
FROM      pizzeria
WHERE     NAME = 'Pizza Hut';

-- Session #1 
UPDATE    pizzeria
SET       rating = 4
WHERE     NAME = 'Pizza Hut';

-- Session #2 
UPDATE    pizzeria
SET       rating = 3.6
WHERE     NAME = 'Pizza Hut';

-- Session #1 then session #2
COMMIT   ;

-- Session #1 then session #2
SELECT    *
FROM      pizzeria
WHERE     NAME = 'Pizza Hut';
