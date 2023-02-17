--Demo: explicit cursor for with parameters

-- Syntax: cursor for with parameters
-- DECLARE
--     CURSOR cursor_name(parameter_name datatype) IS
--         -- Select statment
-- BEGIN
--     FOR record_name IN cursor_name(arguement_value) LOOP
--         --Statement;
--         EXIT WHEN cursor_name%ROWCOUNT > 5; --optional, to jump out the iteration
--     END LOOP;
-- END;

-- Exameple: cursor for with parameter
DECLARE
    CURSOR C_NAME (V_ID EMPLOYEES.EMPLOYEE_ID%TYPE) IS
        SELECT
            FIRST_NAME,
            LAST_NAME
        FROM
            EMPLOYEES
        WHERE
            EMPLOYEE_ID=V_ID;
    V_MAX_ID EMPLOYEES.EMPLOYEE_ID%TYPE;
BEGIN
    SELECT
        MAX (EMPLOYEE_ID) INTO V_MAX_IDs
    FROM
        EMPLOYEES;
    FOR REC_NAME IN C_NAME(V_MAX_ID) LOOP
        DBMS_OUTPUT.PUT_LINE(REC_NAME.FIRST_NAME
            || ' '
            || REC_NAME.LAST_NAME);
    END LOOP;
END;