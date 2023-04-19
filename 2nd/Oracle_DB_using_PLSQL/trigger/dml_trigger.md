# PLSQL DML Trigger

[Back](../index.md)

- [PLSQL DML Trigger](#plsql-dml-trigger)
  - [DML Trigger](#dml-trigger)
  - [Creating DML Trigger](#creating-dml-trigger)
  - [Conditional Predicates](#conditional-predicates)
    - [Example: on a table](#example-on-a-table)
    - [Example: on a specific column](#example-on-a-specific-column)
  - [Statement Trigger](#statement-trigger)
    - [Example: Statement Trigger](#example-statement-trigger)
  - [Row Triggers](#row-triggers)
    - [Example: row trigger](#example-row-trigger)
    - [:OLD and :NEW Qualifiers](#old-and-new-qualifiers)
    - [REFERENCING Clause](#referencing-clause)
    - [WHEN clause](#when-clause)
    - [INSTEAD OF Triggers](#instead-of-triggers)
  - [Compound Trigger](#compound-trigger)

---

## DML Trigger

- A `DML trigger` is a trigger that is automatically fired (executed) whenever an SQL `DML` statement (INSERT, UPDATE, or DELETE) is executed.

- You classify DML triggers in two ways:

  - By **when** they execute:
    - BEFORE
    - AFTER
    - INSTEAD of(view)
  - By **how many times** they execute:
    - a statement trigger: Once for the whole DML statement
    - a row trigger: once for each row affected by the DML statement

- use a `DML trigger` to **enforce complex business rules** that cannot be enforced by a constraint.用来执行约束无法实现的复杂规范

- Transaction control statements are not allowed in a trigger body.(`COMMIT`, `ROLLBACK`,`SAVEPOINT`)

---

## Creating DML Trigger

- Syntax:

```sql
CREATE [OR REPLACE] TRIGGER trigger_name
timing event1 [OR event2 OR event3] ON object_name
trigger_body
```

- **timing**: When the trigger fires in relation to the triggering event.

  - `BEFORE`: Execute the trigger body **before** the triggering DML event on a table
  - `AFTER`: Execute the trigger body **after** the triggering DML event on a table.
  - `INSTEAD OF`: Execute the <u>trigger body</u> **instead of** the triggering <u>DML event</u> on a **complex view**.

- **event**: Which **DML operation** causes the trigger to fire.

  - `INSERT`
  - `UPDATE` [OF column]: can be updates of a specific column or columns
  - `DELETE`
  - more than one triggering event: connected with `OR`
    - `AFTER INSERT OR DELETE OR UPDATE ON employees`

- **object_name**:

  - The `table` or `view` associated with the trigger.

- **trigger_body**: The action(s) performed by the trigger are defined in **an anonymous block**. 注意是匿名,即 begin/end;.

---

## Conditional Predicates

- The trigger keywords `DELETING`, `INSERTING`, and `UPDATING` are automatically declared Boolean variables which are set to TRUE or FALSE by the Oracle server.

- use conditional predicates to test for UPDATE on a **specific column**

### Example: on a table

```sql
-- conditional predicate

DROP TRIGGER secure_emp;

CREATE OR REPLACE TRIGGER secure_emp BEFORE
    INSERT OR UPDATE OR DELETE ON employees
BEGIN
    IF to_char(sysdate, 'DY') IN ('SAT', 'SUN') THEN
        IF deleting THEN
            raise_application_error (-20501, 'You may delete from EMPLOYEES table only during business hours');
        ELSIF inserting THEN
            raise_application_error (-20502, 'You may insert into EMPLOYEES table only during business hours');
        ELSIF updating THEN
            raise_application_error (-20503, 'You may update EMPLOYEES table only during business hours');
        END IF;
    END IF;
END;
```

### Example: on a specific column

```sql
DROP TRIGGER secure_emp;

CREATE OR REPLACE TRIGGER secure_emp BEFORE
    UPDATE ON employees
BEGIN
    IF updating('SALARY') THEN
        IF to_char(sysdate, 'DY') IN ('SAT', 'SUN') THEN
            raise_application_error (-20501, 'You may not update SALARY on the weekend');
        END IF;
    ELSIF updating('JOB_ID') THEN
        IF to_char(sysdate, 'DY') = 'SUN' THEN
            raise_application_error (-20502, 'You may not update JOB_ID on Sunday');
        END IF;
    END IF;
END;
```

---

## Statement Trigger

- Fires **only once** for each execution of the triggering statement (even if no rows are affected)
- the default type of DML trigger
- Fires once even if no rows are affected
- Useful if the trigger body **does not need to process column values from affected rows**.主要用于无需获取受影响的行.

- Example:

  ```sql
  CREATE OR REPLACE TRIGGER LOG_EMPS AFTER
      UPDATE OF SALARY ON EMPLOYEES
  BEGIN
      INSERT INTO LOG_EMP_TABLE (
          WHO
        , WHEN
      ) VALUES (
          USER
        , SYSDATE
      );
  END;
  ```

  - This trigger inserts exactly one row into the log table, regardless of whether the triggering statement updates one employee, several employees, or **no employees** at all.
    - 注意: 即使是没有更新也会记录,即主要是 DML 语句即可.

---

### Example: Statement Trigger

```sql
-- example: enforce complex business rules that cannot be enforced by a constraint.

CREATE OR REPLACE TRIGGER secure_emp BEFORE
    INSERT ON employees
BEGIN
    IF to_char(sysdate, 'DY') IN ('SAT', 'SUN') THEN
        raise_application_error(-20500, 'You may insert into EMPLOYEES table only during business hours');
    END IF;
END;
```

---

## Row Triggers

- A `row trigger` fires (executes) **once for each row affected** by the triggering DML statement, either just `BEFORE` the row is processed or just `AFTER`.

- using `FOR EACH ROW`

---

### Example: row trigger

- 判断外键是否存在, 如果不存在,no_data_found 中创建

```sql
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
```

---

### :OLD and :NEW Qualifiers

- only with row triggers.

- `:OLD.column_name` to reference the preupdate value
- `:NEW.column_name` to reference the post-update value.
- 对没有影响的列,新旧值相同.
- insert:
  - new: new value
  - old: NULL
- delete:
  - new: NULL
  - old: old value
- 可以使用:NEW 作为过滤器,即使用 if 判断新值,如果如符合则 raise_application_error.
- 可以在 raise_application_error 中使用:NEW, 用以具体列名出错时的语句.

  - 此时因为 error, DML 将不会执行,已经执行的将回滚 roll back.

- Example:

```sql
CREATE OR REPLACE TRIGGER LOG_EMPS AFTER
    UPDATE OF SALARY ON EMPLOYEES FOR EACH ROW
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
      , :OLD.EMPLOYEE_ID
      , :OLD.SALARY
      , :NEW.SALARY
    );
END;
```

### REFERENCING Clause

- only with row triggers.

```sql
CREATE OR REPLACE TRIGGER LOG_EMPS AFTER
    UPDATE OF SALARY ON OLD REFERENCING OLD AS FORMER NEW AS LATTER FOR EACH ROW
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
```

---

### WHEN clause

- only with row triggers.
- 注意: when 需要括号

```sql
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
```

---

### INSTEAD OF Triggers

- `INSTEAD OF triggers` are always row triggers.

a complex view based on a join of tables.

```sql

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
```

---

## Compound Trigger

- A `Compound Trigger` has a declaration section and a section for each of its timing points.

- The scope of Compound Trigger variables is the whole trigger, so they retain their scope throughout the whole execution.

```sql

CREATE OR REPLACE TRIGGER log_emps FOR
    UPDATE OF salary ON copy_employees COMPOUND TRIGGER
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
```

---

[TOP](#plsql-dml-trigger)
