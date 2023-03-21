-- Function

CREATE OR REPLACE FUNCTION lab_emp_isvalid(
    p_emp_id NUMBER
) RETURN BOOLEAN IS
    v_emp_id lab_emp.emp_id%type;
BEGIN
    SELECT emp_id INTO v_emp_id
    FROM lab_emp
    WHERE emp_id = p_emp_id;
    RETURN true;
EXCEPTION
    WHEN no_data_found THEN
        RETURN false;
    WHEN OTHERS THEN
        RETURN NULL;
END;
/

DECLARE
    v_lab_emp_id lab_emp.emp_id%type :=2;
BEGIN
    IF lab_emp_isvalid(v_lab_emp_id) THEN
        dbms_output.put_line('true'); -- true
    END IF;
END;