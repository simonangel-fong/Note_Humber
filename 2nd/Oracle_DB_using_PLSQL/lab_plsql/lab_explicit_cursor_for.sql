--Demo: explicit cursor for

-- -- Explicit cursor for
-- DECLARE
--     CURSOR cursor_name IS
--         -- Select statememt;
-- BEGIN
--     FOR record_name IN cursor_name LOOP
--         -- statement;
--     END LOOP;
-- END;

-- Example: Explicit cursor for
DECLARE
    CURSOR CUR_EMP IS
        SELECT
            *
        FROM
            EMPLOYEES;
BEGIN
    FOR V_EMP_RECORD IN CUR_EMP LOOP
        DBMS_OUTPUT.PUT_LINE(V_EMP_RECORD.FIRST_NAME
            ||' '
            ||V_EMP_RECORD.LAST_NAME);
    END LOOP;
END;