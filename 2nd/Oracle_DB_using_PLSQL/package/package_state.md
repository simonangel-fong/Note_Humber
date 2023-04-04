# PLSQL Package State

[Back](../index.md)

- [PLSQL Package State](#plsql-package-state)
  - [Package State](#package-state)
  - [Persistence](#persistence)
    - [Example: Variable](#example-variable)
  - [Persistent State of a Package Cursor](#persistent-state-of-a-package-cursor)
    - [Example: Package Cursor](#example-package-cursor)

## Package State

- `package state`: the collection of package variables and their current for a session.

- The package state is:

  - **Initialized** when the package is **first loaded**
  - Persistent (by default) **for the life of the session**
  - Stored in the session’s **private memory area**
  - Unique to each session even if the **second session** is started by the same user
  - Subject to change when package subprograms are called or public variables are modified.

- Other sessions each have their own package state, and do not see your changes.

---

## Persistence

- `Presenter`: refers to object and process characteristic that continue to exist even after the process that created it ceases.

- `database persistence`: values of data in database persist after any commited changes.
- `session persistence`: values assigned to package-level variables persist for the length of each session, even if the program that performed the assignment has ended.

  - The changes of values would not be visible in other sessions, even if both sessions are connected under the same user name. 即使是相同用户名, 各自 session 中的值都相互独立.

### Example: Variable

```sql

-- package
CREATE OR REPLACE PACKAGE pers_pkg IS
  g_var NUMBER := 10;
  PROCEDURE upd_g_var (p_var IN NUMBER);
END pers_pkg;

-- package body
CREATE OR REPLACE PACKAGE BODY pers_pkg IS
  PROCEDURE upd_g_var (p_var IN NUMBER) IS
    BEGIN
      g_var := p_var;
    END upd_g_var;
END pers_pkg;

-- gran previliges
GRANT EXECUTE ON pers_pkg TO SCOTT, JONES;
 G
```

> 1.  Scott, Jones 各自调用包时,公共变量 g_var 的初始值都是 10;
> 2.  如果在他们各自的 session 中调用 upd_g_var()修改 g_var 值, 则该值会改变.
> 3.  在他们各自的 session 中赋不同的值, 只对各自的 session 有效, 互不影响.
> 4.  当 Scott 断开一个 session, 然后重开一个新 session 时, 初始值都是 10
>     总结: 每当开启一个新 session 时,包的公共变量值都会有一份副本在各自的 private memory area.

---

## Persistent State of a Package Cursor

- A cursor declared in the package specification follows the same persistency rules as any other variable.

- A cursor’s state consists of the following attributes:
  - Whether the cursor is open or closed
  - If open, how many rows have been fetched from the cursor (`%ROWCOUNT`) and whether the most recent fetch was successful (`%FOUND` or `%NOTFOUND`).

### Example: Package Cursor

- 1. define a cursor in specification.
- 2. call the procedure to open cursor to get data.
- 3. call function to display a specific number of rows.
- This technique is often used in applications that need to `FETCH` a large number of rows from a cursor.
- 这里的游标中数据即使用了 persistence, 即包中游标对每个 session 有效. 不同的 session 会有不同的游标数据.

```sql
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
```

---

[TOP](#plsql-package-state)
