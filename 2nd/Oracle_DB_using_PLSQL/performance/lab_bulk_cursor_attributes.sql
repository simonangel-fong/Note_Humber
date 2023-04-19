-- bulk cursor attributes

CREATE TABLE lab_tb_emp AS
    SELECT *
    FROM employees;

TRUNCATE TABLE lab_tb_emp;

SELECT *
FROM lab_tb_emp;

/

CREATE OR REPLACE PROCEDURE lab_insert_emps IS
    TYPE t_emps IS
        TABLE OF employees%rowtype INDEX BY BINARY_INTEGER;
    v_emptab t_emps;
BEGIN
 -- bulk collect
    SELECT * BULK COLLECT INTO v_emptab
    FROM employees;
 -- forall
    FORALL i IN v_emptab.first..v_emptab.last
        INSERT INTO lab_tb_emp VALUES v_emptab(
            i
        );
    FOR i IN v_emptab.first..v_emptab.last LOOP
        dbms_output.put_line('Inserted: ' || i || ' '||sql%bulk_rowcount(i)|| 'rows');
    END LOOP;
END lab_insert_emps;
/

BEGIN
    lab_insert_emps();
END;
 -- Inserted: 1 1rows
 -- Inserted: 2 1rows
 -- Inserted: 3 1rows
 -- Inserted: 4 1rows
 -- ...
/

CREATE OR REPLACE PROCEDURE lab_insert_emps IS
    TYPE t_emps IS
        TABLE OF employees%rowtype INDEX BY BINARY_INTEGER;
    v_emptab t_emps;
BEGIN
    SELECT * BULK COLLECT INTO v_emptab
    FROM employees;
    FORALL i IN v_emptab.first..v_emptab.last
        SAVE EXCEPTIONS
        INSERT INTO lab_tb_emp VALUES v_emptab(
            i
        );
    FOR i IN v_emptab.first..v_emptab.last LOOP
        dbms_output.put_line('Inserted: ' || i || ' '||sql%bulk_rowcount(i)|| 'rows');
    END LOOP;
EXCEPTION
    WHEN OTHERS THEN
        FOR j IN 1..sql%bulk_exceptions.count LOOP
            dbms_output.put_line(sql%bulk_exceptions(j).error_index);
            dbms_output.put_line(sql%bulk_exceptions(j).error_code);
        END LOOP;
END lab_insert_emps;
/

BEGIN
    lab_insert_emps();
END;