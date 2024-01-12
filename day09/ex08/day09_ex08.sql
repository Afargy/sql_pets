CREATE    FUNCTION fnc_fibonacci (max_num INTEGER DEFAULT 10) RETURNS SETOF INTEGER AS $$
  WITH      RECURSIVE r (num, prev) AS (
            SELECT    0,
                      1,
                      1 AS i
            UNION ALL
            SELECT    num + prev,
                      num,
                      i + 1 AS i
            FROM      r
            WHERE     num + prev < max_num
            )
  SELECT    num
  FROM      r;
$$ LANGUAGE SQL;

SELECT    *
FROM      fnc_fibonacci (100);

SELECT    *
FROM      fnc_fibonacci ();
