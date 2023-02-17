--Demo: Explicit cursor for - Subquery

-- -- Explicit cursor for - Subquery
-- DECLARE
--  -- not require to declear cursor and variable
-- BEGIN
--     FOR RECORD_NAME IN ( /*Subquery statement*/) LOOP
--     -- Statement;
--     END LOOP;
-- END;

-- Example: Explicit cursor for - Subquery
DECLARE
BEGIN
    FOR REC_EMP IN (
        SELECT
            *
        FROM
            EMPLOYEES
    ) LOOP
        DBMS_OUTPUT.PUT_LINE(REC_EMP.FIRST_NAME
            ||' '
            ||REC_EMP.LAST_NAME);
    END LOOP;
END;