-- 经典错误
-- 抛出异常e_myexcep到外层, 但外层没有定义e_myexcep,所以不会处理异常.

-- BEGIN
--     DECLARE
--         e_myexcep EXCEPTION;
--     BEGIN
--         RAISE e_myexcep;
--         dbms_output.put_line('Message 1');
--     EXCEPTION
--         WHEN too_many_rows THEN
--             dbms_output.put_line('Message 2');
--     END;
--     dbms_output.put_line('Message 3');
-- EXCEPTION
--     WHEN e_myexcep THEN --identifier 'E_MYEXCEP' must be declared
--         dbms_output.put_line('Message 4');
-- END;
-- 修正
DECLARE
    e_myexcep EXCEPTION;
BEGIN
    BEGIN
        RAISE e_myexcep;
        dbms_output.put_line('Message 1');
    EXCEPTION
        WHEN too_many_rows THEN
            dbms_output.put_line('Message 2');
    END;
    dbms_output.put_line('Message 3');
EXCEPTION
    WHEN e_myexcep THEN
        dbms_output.put_line('Message 4'); --Message 4
END;
/
-- 由于没有handler, 会抛出到Oracle 环境
DECLARE
    e_myexcep EXCEPTION;
BEGIN
    BEGIN
        RAISE e_myexcep;
        dbms_output.put_line('Message 1');
    EXCEPTION
        WHEN too_many_rows THEN
            dbms_output.put_line('Message 2');
    END;
    dbms_output.put_line('Message 3');
EXCEPTION
    WHEN no_data_found THEN
        dbms_output.put_line('Message 4');
END;