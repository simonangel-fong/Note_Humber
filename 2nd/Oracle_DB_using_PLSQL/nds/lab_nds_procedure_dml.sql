-- native ds

CREATE TABLE test_message(
    id NUMBER(6)
  , text VARCHAR2(256)
);

/

CREATE OR REPLACE PROCEDURE add_row(
    p_table_name VARCHAR2
  , p_id NUMBER
  , p_name VARCHAR2
) IS
    v_stmnt VARCHAR2(200);
BEGIN
    v_stmnt :='INSERT INTO ' || p_table_name || ' VALUES(' || p_id || ', ''' || p_name || ''')';
    EXECUTE IMMEDIATE v_stmnt;
    dbms_output.put_line(sql%rowcount||' rows inserted.');
END;
/

BEGIN
    add_row('test_message', 1, 'text01');
END;
/

SELECT *
FROM test_message;