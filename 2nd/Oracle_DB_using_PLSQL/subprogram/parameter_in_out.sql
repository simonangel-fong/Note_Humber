-- Procedure: Parameter IN OUT

DROP PROCEDURE lab_show_parameter_in_out;

CREATE OR REPLACE PROCEDURE lab_show_parameter_in_out(
    p_message IN OUT VARCHAR2
) IS
BEGIN
    dbms_output.put_line('Procedure: Parameter IN OUT');
    dbms_output.put_line('Input message: '||p_message);
    p_message := '('||p_message||')';
END;
/

DECLARE
    v_message VARCHAR2(20) :='&v_message';
BEGIN
    lab_show_parameter_in_out(v_message);
    dbms_output.put_line('After procedure: '||v_message);
END;