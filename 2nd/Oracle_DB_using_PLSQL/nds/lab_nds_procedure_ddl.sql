-- NDS in procedure

-- -- compilation error
-- CREATE PROCEDURE DROP_ANY_TABLE(
--     P_TABLE_NAME VARCHAR2
-- ) IS
-- BEGIN
--     DROP TABLE P_TABLE_NAME; -- cannot be parsed
-- END;
/

CREATE OR REPLACE PROCEDURE drop_any_table(
    p_table_name VARCHAR2
) IS
    v_dynamic_stmt VARCHAR2(128);
BEGIN
    v_dynamic_stmt :='drop table ' ||p_table_name;
    EXECUTE IMMEDIATE v_dynamic_stmt;
 -- EXCEPTION
 --     WHEN OTHERS THEN
 --         dbms_output.put_line('This table does not exist.')
END;
/

CREATE TABLE test_message(
    id NUMBER(6)
  , text VARCHAR2(256)
);

-- one row selected
SELECT object_name
  , object_type
FROM user_objects
WHERE object_name = upper('test_message');

/

BEGIN
    drop_any_table('test_message');
END;
/

-- no row selected
SELECT object_name
  , object_type
FROM user_objects
WHERE object_name = upper('test_message');