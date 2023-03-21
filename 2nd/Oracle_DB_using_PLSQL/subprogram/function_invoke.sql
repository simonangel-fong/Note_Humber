-- Function

CREATE OR REPLACE FUNCTION lab_square(
    p_int NUMBER
) RETURN NUMBER IS
BEGIN
    RETURN p_int*p_int;
END;
/

-- invoking a function as part of a PL/SQL expression,
DECLARE
    v_result NUMBER;
BEGIN
    v_result :=lab_square(2);
    dbms_output.put_line(v_result);
END;
/

-- Invoking a Function as a Parameter in Another Subprogram
DECLARE
BEGIN
    dbms_output.put_line(lab_square(10));
END;
/

-- Invoking a Function as an Expression in a SQL Statement
-- 400
SELECT lab_square(20)
FROM dual;