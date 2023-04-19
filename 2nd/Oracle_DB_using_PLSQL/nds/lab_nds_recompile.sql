-- recompile

CREATE OR REPLACE PROCEDURE compile_plsql (
    p_name VARCHAR2
  , p_type VARCHAR2
  , p_options VARCHAR2 := NULL
) IS
    v_stmt VARCHAR2(200);
BEGIN
    v_stmt := 'ALTER ' || p_type || ' ' || p_name || ' COMPILE' || ' ' || p_options;
    EXECUTE IMMEDIATE v_stmt;
    dbms_output.put_line('Recompile successfully.');
END;
/

BEGIN
    compile_plsql('add_row', 'procedure');
END;