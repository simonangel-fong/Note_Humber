-- Procedure: Parameter IN

DROP PROCEDURE lab_show_parameter_in;

CREATE OR REPLACE PROCEDURE lab_show_parameter_in(
    p_message VARCHAR2
) IS
BEGIN
    dbms_output.put_line('Procedure: Parameter IN');
    dbms_output.put_line('Input message: '||p_message);
END;
/

DECLARE
    v_message VARCHAR2(20) :='&v_message';
BEGIN
    lab_show_parameter_in(v_message);
END;