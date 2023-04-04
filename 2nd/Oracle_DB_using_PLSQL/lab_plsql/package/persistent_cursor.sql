-- persistent state: cursor

-- package specification
CREATE OR REPLACE PACKAGE lab_cur_pkg IS
    CURSOR cur_emp IS
        SELECT employee_id
        FROM employees
        ORDER BY employee_id;
    PROCEDURE open_curs;
    FUNCTION fecth_n_rows(
        n NUMBER:=1
    ) RETURN BOOLEAN;
    PROCEDURE close_curs;
END lab_cur_pkg;
/

-- package body
CREATE OR REPLACE PACKAGE BODY lab_cur_pkg IS
    PROCEDURE open_curs IS
    BEGIN
        IF NOT cur_emp%isopen THEN
            OPEN cur_emp;
        END IF;
    END open_curs;
    FUNCTION fecth_n_rows(
        n NUMBER :=1
    ) RETURN BOOLEAN IS
        emp_id employees.employee_id%type;
    BEGIN
        FOR count IN 1 .. n LOOP
            FETCH cur_emp INTO emp_id;
            EXIT WHEN cur_emp%notfound;
            dbms_output.put_line('ID: '||(emp_id));
        END LOOP;
        RETURN cur_emp%found;
    END fecth_n_rows;
    PROCEDURE close_curs IS
    BEGIN
        IF cur_emp%isopen THEN
            CLOSE cur_emp;
        END IF;
    END close_curs;
END lab_cur_pkg;
/

DECLARE
    v_more_rows_exist BOOLEAN := true;
BEGIN
    lab_cur_pkg.open_curs;
    LOOP
        v_more_rows_exist := lab_cur_pkg.fecth_n_rows(3);
        dbms_output.put_line('--------');
        EXIT WHEN NOT v_more_rows_exist;
    END LOOP;
    lab_cur_pkg.close_curs;
END;