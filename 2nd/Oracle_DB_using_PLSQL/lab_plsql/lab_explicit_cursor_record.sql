--Demo: explicit cursor record

-- -- Explicit cursor record
-- DECLARE
--     CURSOR cursor_name IS
--         -- Select statememt;
--     variable_name cursor_name%ROWTYPE;
-- BEGIN
--     OPEN cursor_name;                               -- Open cursor
--     LOOP
--         FETCH cursor_name INTO variable_name;       -- load data from the cursor
--         EXIT WHEN cursor_name%NOTFOUND;             -- condition to exit loop
--         -- some statements
--         -- call field: variable_name.field
--     END LOOP;
--     CLOSE cursor_name;                              -- Close cursor
-- END;


DECLARE
    CURSOR CUR_EMP IS
        SELECT
            *
        FROM
            EMPLOYEES;
    V_EMP_RECORD CUR_EMP%ROWTYPE; --declare a record
BEGIN
    OPEN CUR_EMP; -- Open cursor
    LOOP
        FETCH CUR_EMP INTO V_EMP_RECORD; -- load data from the cursor
        EXIT WHEN CUR_EMP%ROWCOUNT>10 OR CUR_EMP%NOTFOUND; -- condition to exit loop
        DBMS_OUTPUT.PUT_LINE(V_EMP_RECORD.FIRST_NAME
            || ' '
            ||V_EMP_RECORD.LAST_NAME );
        DBMS_OUTPUT.PUT_LINE(CUR_EMP%ROWCOUNT);
    END LOOP;
    CLOSE CUR_EMP; -- Close cursor
END;