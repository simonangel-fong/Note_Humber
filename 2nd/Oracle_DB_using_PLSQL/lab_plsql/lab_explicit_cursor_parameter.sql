--Demo: explicit cursor parameter

-- -- Explicit cursor parameter
-- DECLARE
--     CURSOR cursor_name (parameter_name datatype) IS
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
    CURSOR C_NAME(V_ID EMPLOYEES.EMPLOYEE_ID%TYPE) IS
        SELECT
            FIRST_NAME,
            LAST_NAME
        FROM
            EMPLOYEES
        WHERE
            EMPLOYEE_ID=V_ID;
    V_MAX_ID EMPLOYEES.EMPLOYEE_ID%TYPE;
    V_FNAME  EMPLOYEES.FIRST_NAME%TYPE;
    V_LNAME  EMPLOYEES.LAST_NAME%TYPE;
BEGIN
    SELECT
        MAX(EMPLOYEE_ID) INTO V_MAX_ID
    FROM
        EMPLOYEES;
    OPEN C_NAME(V_MAX_ID);
    LOOP
        FETCH C_NAME INTO V_FNAME, V_LNAME;
        EXIT WHEN C_NAME%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(V_FNAME
            ||' '
            ||V_LNAME);
    END LOOP;
    CLOSE C_NAME;
END;