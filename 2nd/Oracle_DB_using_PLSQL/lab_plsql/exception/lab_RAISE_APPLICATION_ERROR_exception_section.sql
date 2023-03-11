-- RAISE_APPLICATION_ERROR
-- raise error in exception section

DECLARE
    v_dept_id   PLS_INTEGER := 2000;
    v_dept_name departments.department_name%type;
    e_not_found EXCEPTION;
    PRAGMA exception_init(e_not_found, -20201);
BEGIN
    BEGIN
        SELECT department_name INTO v_dept_name
        FROM departments
        WHERE department_id = v_dept_id;
    EXCEPTION
        WHEN no_data_found THEN
            raise_application_error(-20201, 'No department has this id!');
        WHEN too_many_rows THEN
            raise_application_error(-20202, 'Too many employees were found.');
        WHEN e_not_found THEN
            dbms_output.put_line('Error Inner code:'||sqlcode); --not execute, because only one exception handle executes at a time
            dbms_output.put_line('Error Inner message:'||sqlerrm);
    END;
EXCEPTION
    WHEN e_not_found THEN
        dbms_output.put_line('Error outer code:'||sqlcode); --Error outer code:-20201
        dbms_output.put_line('Error outer message:'||sqlerrm); --Error outer message:ORA-20201: No department has this id!
END;