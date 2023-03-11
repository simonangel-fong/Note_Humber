-- RAISE_APPLICATION_ERROR
-- raise error in executable section associating with a user-defined error

DECLARE
    v_dept_id departments.department_id%type := 123;
    e_name EXCEPTION;
    PRAGMA exception_init(e_name, -20999); -- associate a error name with a error code
BEGIN
    DELETE FROM departments
    WHERE
        department_id = v_dept_id;
    IF sql%notfound THEN
        raise_application_error(-20999, 'This is not a valid manager'); --raise an error with a specific code and message
    ELSE
        dbms_output.put_line('Deleted successfully!');
    END IF;
EXCEPTION
    WHEN e_name THEN -- catch the exception by error name
        dbms_output.put_line('Error code: '||sqlcode); --Error code: -20202
        dbms_output.put_line('Error message: '||sqlerrm); -- Error message: ORA-20202: This is not a valid manager
END;
/

SELECT *
FROM departments
WHERE department_id=123;