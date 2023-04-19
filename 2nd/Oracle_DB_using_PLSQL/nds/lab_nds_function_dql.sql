-- NDS function

CREATE OR REPLACE FUNCTION count_rows(
    p_table_name IN VARCHAR2
) RETURN NUMBER IS
    v_stmnt VARCHAR2(265);
    v_count NUMBER;
BEGIN
    v_stmnt := 'SELECT count(*) FROM '|| p_table_name;
    EXECUTE IMMEDIATE v_stmnt INTO v_count;
    RETURN v_count;
END;
/

SELECT COUNT(*)
FROM employees;

SELECT count_rows('employees')
FROM dual;

/

BEGIN
    dbms_output.put_line(count_rows('employees'));
END;