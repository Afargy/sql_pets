CREATE    FUNCTION fnc_trg_person_delete_audit () RETURNS TRIGGER AS $$
  BEGIN
    IF (TG_OP = 'DELETE') THEN 
      INSERT INTO person_audit SELECT now(), 'D', OLD.* ;
    END IF;
      RETURN NULL;
  END;
$$ LANGUAGE PLPGSQL;

CREATE    TRIGGER trg_person_delete_audit
AFTER     DELETE ON person FOR EACH ROW
EXECUTE   PROCEDURE fnc_trg_person_delete_audit ();

DELETE    FROM person
WHERE     id = 10;
