-- Row trigger

SELECT *
FROM log_table;

/

CREATE OR REPLACE TRIGGER LOG_EMPS AFTER
    UPDATE OF SALARY ON EMPLOYEES FOR EACH ROW
BEGIN
    INSERT INTO LOG_TABLE (
        WHO
      , WHEN
      , WHICH_EMPLOYEE
      , OLD_SALARY
      , NEW_SALARY
    ) VALUES (
        USER
      , SYSDATE
      , :OLD.EMPLOYEE_ID
      , :OLD.SALARY
      , :NEW.SALARY
    );
END;
/

CREATE OR REPLACE TRIGGER employee_dept_fk_trg BEFORE
    UPDATE OF department_id ON employees FOR EACH ROW
DECLARE
    v_dept_id departments.department_id%type;
BEGIN
    SELECT department_id INTO v_dept_id
    FROM departments
    WHERE department_id = :new.department_id;
EXCEPTION
    WHEN no_data_found THEN
        INSERT INTO departments VALUES(
            :new.department_id
          , 'Dept '||:new.department_id
          , NULL
          , NULL
        );
END;
/

CREATE OR REPLACE TRIGGER LOG_EMPS AFTER
    UPDATE OF SALARY ON EMPLOYEES REFERENCING OLD AS FORMER NEW AS LATTER FOR EACH ROW
BEGIN
    INSERT INTO LOG_EMP_TABLE (
        WHO
      , WHEN
      , WHICH_EMPLOYEE
      , OLD_SALARY
      , NEW_SALARY
    ) VALUES (
        USER
      , SYSDATE
      , :FORMER.EMPLOYEE_ID
      , :FORMER.SALARY
      , :LATTER.SALARY
    );
END;
/

CREATE OR REPLACE TRIGGER RESTRICT_SALARY AFTER
    UPDATE OF SALARY ON EMPLOYEES FOR EACH ROW WHEN(NEW.SALARY > OLD.SALARY)
BEGIN
    INSERT INTO LOG_EMP_TABLE (
        WHO
      , WHEN
      , WHICH_EMPLOYEE
      , OLD_SALARY
      , NEW_SALARY
    ) VALUES(
        USER
      , SYSDATE
      , :OLD.EMPLOYEE_ID
      , :OLD.SALARY
      , :NEW.SALARY
    );
END;
/

CREATE OR REPLACE TRIGGER new_emp_dept INSTEAD OF
    INSERT ON emp_details
BEGIN
    INSERT INTO new_emps VALUES (
        :new.employee_id
      , :new.last_name
      , :new.salary
      , :new.department_id
    );
    UPDATE new_depts
    SET
        dept_sal = dept_sal + :new.salary
    WHERE
        department_id = :new.department_id;
END;
/

CREATE OR REPLACE TRIGGER log_emps FOR
    UPDATE OF salary ON copy_employees
COMPOUND TRIGGER
    TYPE t_log_emp IS
        TABLE OF log_table%rowtype INDEX BY BINARY_INTEGER;
    log_emp_tab t_log_emp;
    v_index     BINARY_INTEGER := 0;
    AFTER EACH ROW IS
    BEGIN
        v_index := v_index + 1;
        log_emp_tab(v_index).employee_id := :old.employee_id;
        log_emp_tab(v_index).change_date := sysdate;
        log_emp_tab(v_index).salary := :new.salary;
    END AFTER EACH ROW;
    AFTER STATEMENT IS
    BEGIN
        FORALL i IN log_emp_tab.first..log_emp_tab.last
            INSERT INTO log_table VALUES log_emp_tab(
                i
            );
    END AFTER STATEMENT;
END log_emps;