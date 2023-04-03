-- Using a Record Structure as a Parameter

CREATE OR REPLACE PROCEDURE lab_select_one_emp(
    p_emp_id IN employees.employee_id%type
  , p_rec_emp OUT employees%rowtype
) IS
BEGIN
    SELECT * INTO p_rec_emp
    FROM employees
    WHERE employee_id = p_emp_id;
EXCEPTION
    WHEN no_data_found THEN
        p_rec_emp.last_name:='No Data';
END;
/

DECLARE
    v_rec_emp employees%rowtype;
BEGIN
    lab_select_one_emp(100, v_rec_emp);
    dbms_output.put_line(v_rec_emp.last_name); --King
END;