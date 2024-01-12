CREATE    FUNCTION fnc_trg_person_update_audit () RETURNS TRIGGER AS $$ 
  BEGIN
    IF (TG_OP = 'UPDATE') THEN 
      INSERT INTO person_audit SELECT now(), 'U', OLD.* ;
    END IF;
      RETURN NULL;
  END;
$$ LANGUAGE PLPGSQL;

CREATE    TRIGGER trg_person_update_audit
AFTER    
UPDATE    ON person FOR EACH ROW
EXECUTE   PROCEDURE fnc_trg_person_update_audit ();

UPDATE    person
SET       NAME = 'Bulat'
WHERE     id = 10;
