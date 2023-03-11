-- raise statement

DECLARE
    v_x          NUMBER := &x;
    v_y          NUMBER := &y;
    v_z          NUMBER;
    e_divide_one EXCEPTION;
BEGIN
    IF v_y = 1 THEN
        RAISE e_divide_one; --raise a user-defined error
    END IF;
    IF v_y = 2 THEN
        RAISE zero_divide; --raise a predefined error
    END IF;
    v_z :=v_x/v_y;
    dbms_output.put_line(v_z);
EXCEPTION
    WHEN e_divide_one THEN  --catch the user-defined error
        dbms_output.put_line('Warning: Divisor cannot be one.');
    WHEN zero_divide THEN   --catch a predefined error
        dbms_output.put_line('Error: Divisor cannot be zero.');
END;