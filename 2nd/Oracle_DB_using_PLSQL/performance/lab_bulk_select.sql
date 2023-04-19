-- BULK COLLECT


CREATE OR REPLACE PROCEDURE lab_fetch_all_emps IS
    CURSOR emp_curs IS
        SELECT *
        FROM employees;
BEGIN
    FOR v_emprec IN emp_curs LOOP
        dbms_output.put_line(v_emprec.first_name);
    END LOOP;
END lab_fetch_all_emps;
/

CREATE OR REPLACE PROCEDURE lab_fetch_all_emps IS
    TYPE t_emp IS
        TABLE OF employees%rowtype INDEX BY BINARY_INTEGER;
    v_emptab t_emp;
BEGIN
 -- BULK COLLECT
    SELECT * BULK COLLECT INTO v_emptab
    FROM employees;
    FOR i IN v_emptab.first..v_emptab.last LOOP
        IF v_emptab.EXISTS(i) THEN
            dbms_output.put_line(v_emptab(i).last_name);
        END IF;
    END LOOP;
END lab_fetch_all_emps;