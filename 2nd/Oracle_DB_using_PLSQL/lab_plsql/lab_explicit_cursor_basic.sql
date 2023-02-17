--Demo: explicit cursor syntax

-- -- Basic explicit cursor
-- DECLARE
--     CURSOR cursor_name IS
--         -- Select statememt;
--     variable_name DATATYPE;
-- BEGIN
--     OPEN cursor_name;                               -- Open cursor
--     LOOP
--         FETCH cursor_name INTO variable_name;       -- load data from the cursor
--         EXIT WHEN cursor_name%NOTFOUND;             -- condition to exit loop
--         -- some statements
--     END LOOP;
--     CLOSE cursor_name;                              -- Close cursor
-- END;

DECLARE
    CURSOR CUR_DEPTS_EMPS IS
        SELECT
            FIRST_NAME
        FROM
            EMPLOYEES;
    V_FNAME EMPLOYEES.FIRST_NAME%TYPE;
    V_ATTR  NUMBER;
BEGIN
    OPEN CUR_DEPTS_EMPS;
    LOOP
        FETCH CUR_DEPTS_EMPS INTO V_FNAME;
        V_ATTR := CUR_DEPTS_EMPS%ROWCOUNT;
        EXIT WHEN CUR_DEPTS_EMPS%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(TO_CHAR(V_ATTR)
            ||'-'
            ||V_FNAME);
    END LOOP;
    CLOSE CUR_DEPTS_EMPS;
END;
/

SELECT
    *
FROM
    EMPLOYEES;