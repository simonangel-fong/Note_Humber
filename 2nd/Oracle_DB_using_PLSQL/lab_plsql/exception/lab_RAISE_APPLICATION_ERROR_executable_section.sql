-- RAISE_APPLICATION_ERROR
-- with no user-defined error

DECLARE
    v_dept_id departments.department_id%type := 123;
BEGIN
    DELETE FROM departments
    WHERE
        department_id = v_dept_id;
    IF sql%notfound THEN
        raise_application_error(-20202, 'This is not a valid manager'); --raise an error with a specific error code and message
    END IF;
EXCEPTION
    WHEN OTHERS THEN -- catch/trap all else errors
        dbms_output.put_line('Error code: '||sqlcode); --Error code: -20202
        dbms_output.put_line('Error message: '||sqlerrm); -- Error message: ORA-20202: This is not a valid manager
END;
/

SELECT *
FROM departments
WHERE department_id=123;