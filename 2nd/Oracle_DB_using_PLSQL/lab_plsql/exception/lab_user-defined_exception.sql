-- user-defined exception

DECLARE
    e_update EXCEPTION; -- defined an exception
BEGIN
    UPDATE departments
    SET
        department_name='humber'
    WHERE
        department_id= 2000;
    IF sql%notfound THEN -- raise a user-defined exception
        RAISE e_update;
    END IF;
    dbms_output.put_line('Update completed!');
EXCEPTION
    WHEN e_update THEN -- catch/trap a exception
        dbms_output.put_line('Error: The given department number is invalid!');
END;