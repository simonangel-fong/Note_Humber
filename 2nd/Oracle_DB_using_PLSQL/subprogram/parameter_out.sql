-- Procedure: Parameter OUT

DROP PROCEDURE lab_show_parameter_out;

CREATE OR REPLACE PROCEDURE lab_show_parameter_out IS
BEGIN
    dbms_output.put_line('Procedure: Parameter OUT');
    dbms_output.put_line('Date: '||to_char(sysdate()));
END;
/

DECLARE
BEGIN
    lab_show_parameter_out;
END;