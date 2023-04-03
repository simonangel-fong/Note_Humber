-- list packages

-- using user_objects
SELECT *
FROM user_objects
WHERE object_type = upper('package');

-- using all_objects
SELECT *
FROM all_objects
WHERE object_type = upper('package')
    AND owner = upper('N01555914');

-- using user_source
SELECT DISTINCT name
FROM user_source
WHERE type = upper('package');

-- using all_source
SELECT *
FROM all_source
WHERE type = upper('package')
    AND owner = upper('N01555914');

-- get source: package specification
-- using user_source
SELECT text
FROM user_source
WHERE type = upper('package')
    AND name = upper('DEPT_PKG')
ORDER BY line;

-- using all_source
SELECT text
FROM all_source
WHERE type = upper('package')
    AND owner = upper('N01555914')
    AND name = upper('DEPT_PKG')
ORDER BY line;

-- get source: package body
-- using user_source
SELECT text
FROM user_source
WHERE type = upper('package body')
    AND name = upper('DEPT_PKG')
ORDER BY line;

-- using all_source
SELECT text
FROM all_source
WHERE type = upper('package body')
    AND owner = upper('N01555914')
    AND name = upper('DEPT_PKG')
ORDER BY line;

/

-- using user_source
DECLARE
    CURSOR cur_text IS
        SELECT text
        FROM user_source
        WHERE type = upper('package')
            AND name = upper('DEPT_PKG');
    v_text user_source.text%type;
BEGIN
    OPEN cur_text;
    LOOP
        FETCH cur_text INTO v_text;
        EXIT WHEN cur_text%notfound;
        dbms_output.put_line(v_text);
    END LOOP;
    CLOSE cur_text;
END;
/

-- using all_source
DECLARE
    CURSOR cur_text IS
        SELECT text
        FROM all_source
        WHERE type = upper('package')
            AND name = upper('DEPT_PKG');
    v_text user_source.text%type;
BEGIN
    OPEN cur_text;
    LOOP
        FETCH cur_text INTO v_text;
        EXIT WHEN cur_text%notfound;
        dbms_output.put_line(v_text);
    END LOOP;
    CLOSE cur_text;
END;
/

desc dept_pkg;

/

SELECT line
  , text
  , position
FROM user_errors
WHERE name = upper('HUMBER')
    AND type = upper('PACKAGE BODY')
ORDER BY sequence;

/

SELECT e.line
  , e.position
  , s.text AS source
  , e.text AS error
FROM user_errors e
    JOIN user_source s
    ON e.name = s.name
    AND e.type = s.type
WHERE e.name = upper('DEPT_PKG')
    AND e.type = upper('PACKAGE BODY')
ORDER BY e.sequence;