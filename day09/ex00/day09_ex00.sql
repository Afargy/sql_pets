CREATE    TABLE person_audit (
          created TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
          type_event CHAR(1) NOT NULL DEFAULT 'I' CHECK (type_event IN ('I', 'U', 'D')),
          row_id BIGINT NOT NULL,
          NAME VARCHAR,
          age INTEGER,
          gender VARCHAR,
          address VARCHAR
          );

CREATE    FUNCTION fnc_trg_person_insert_audit () RETURNS TRIGGER AS $$
  BEGIN
    IF (TG_OP = 'INSERT') THEN 
      INSERT INTO person_audit SELECT now(), 'I', NEW.* ;
    END IF;
      RETURN NULL;
  END;
$$ LANGUAGE PLPGSQL;

CREATE    TRIGGER trg_person_insert_audit
AFTER     INSERT ON person FOR EACH ROW
EXECUTE   PROCEDURE fnc_trg_person_insert_audit ();

INSERT    INTO person
VALUES    (10, 'Damir', 22, 'male', 'Irkutsk');
