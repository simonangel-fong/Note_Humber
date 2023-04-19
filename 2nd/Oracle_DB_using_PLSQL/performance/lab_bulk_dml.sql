-- bulk dml


CREATE OR REPLACE PROCEDURE copy_emps IS
    TYPE t_emps IS
        TABLE OF employees%rowtype INDEX BY BINARY_INTEGER;
    v_emptab t_emps;
BEGIN
    FOR i IN v_emptab.first..v_emptab.last LOOP
        INSERT INTO new_employees VALUES v_emptab(
            i
        );
    END LOOP;
END copy_emps;
/

CREATE OR REPLACE PROCEDURE copy_emps IS
    TYPE t_emps IS
        TABLE OF employees%rowtype INDEX BY BINARY_INTEGER;
    v_emptab t_emps;
BEGIN
 -- BULK COLLECT
    SELECT * BULK COLLECT INTO v_emptab
    FROM employees;
 -- FORALL
    FORALL i IN v_emptab.first..v_emptab.last
        INSERT INTO new_employees VALUES v_emptab(
            i
        );
END copy_emps;
/

CREATE OR REPLACE PROCEDURE update_emps IS
    TYPE t_emp_id IS
        TABLE OF employees.employee_id%type INDEX BY BINARY_INTEGER;
    v_emp_id_tab t_emp_id;
BEGIN
    SELECT employee_id BULK COLLECT INTO v_emp_id_tab
    FROM employees;
    FORALL i IN v_emp_id_tab.first..v_emp_id_tab.last
        UPDATE new_employees
        SET
            salary = salary * 1.05
        WHERE
            employee_id = v_emp_id_tab(
                i
            );
END update_emps;