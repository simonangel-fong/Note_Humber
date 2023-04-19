# PL/SQL - Performance

[Back](../index.md)

- [PL/SQL - Performance](#plsql---performance)
  - [Using the `NOCOPY` Hint](#using-the-nocopy-hint)
  - [Function Based Indexes: `DETERMINISTIC`](#function-based-indexes-deterministic)
  - [Bulk Binding](#bulk-binding)
    - [Bulk Binding a SELECT: `BULK COLLECT`](#bulk-binding-a-select-bulk-collect)
    - [Bulk Binding with DML: `FORALL`](#bulk-binding-with-dml-forall)
    - [Bulk Binding Cursor Attributes](#bulk-binding-cursor-attributes)
      - [`SQL%BULK_ROWCOUNT`](#sqlbulk_rowcount)
      - [`SQL%BULK_EXCEPTIONS`](#sqlbulk_exceptions)
  - [`RETURNING` Clause](#returning-clause)

---

## Using the `NOCOPY` Hint

- two ways to pass parameter arguments between a calling program and a called subprogram:

  - by value
  - by reference.

- `Passing by value`:

  - the argument values are copied from the calling program’s memory to the subprogram’s memory, and copied back again when the subprogram is exited.
  - So while the subprogram is executing, there are two copies of each argument.

- `Passing by reference`:

  - the argument values are not copied.
  - The two programs share a single copy of the data.

- While `passing by value` is **safer**, it can **use a lot of memory and execute slowly** if the argument value is large

- By default, PL/SQL `IN` parameter arguments are passed `by reference`, while `OUT` and `IN OUT` arguments are passed `by value`.

  - can change this to pass an OUT or IN OUT argument by reference, using the `NOCOPY` hint.

- `NOCOPY`

  - must come immediately after the parameter mode (`OUT` or `IN OUT`).
  - Specify `NOCOPY` to instruct the database to pass an argument as fast as possible.
  - enhance performance when passing a large value.

- Examepl:

  ```sql
  CREATE OR REPLACE PACKAGE lab_emp_pkg IS
      TYPE t_emp IS
          TABLE OF employees%rowtype INDEX BY BINARY_INTEGER;
      PROCEDURE emp_proc (
          p_small_arg IN NUMBER
        , p_big_arg OUT NOCOPY t_emp
      );
  END lab_emp_pkg;
  ```

---

## Function Based Indexes: `DETERMINISTIC`

- **Any valid Oracle built-in function** can be used in a `Function-Based Index`.
- Also, any database function you write yourself can be used.

- one rule you must remember: if you are writing your own functions to use in a `Function Based Index`,
  you must include the key word `DETERMINISTIC` in the function header.

- In mathematics, a deterministic system is a system in which **no randomness is involved** in the development of future states of the system.
- `Deterministic models` therefore \**produce the same output*8 for a given starting condition.

- When an Oracle Database encounters a `deterministic function`, it attempts to **use previously calculated results** when possible rather than re-executing the function
- Specify `DETERMINISTIC` for a user-defined function to indicate that the function **returns the same** result value whenever it is invoked with the same values for its parameters.
- **Do not** specify `DETERMINISTIC` for a function whose result **depends on the value of session variables** or **the state of schema objects**, because results might vary across calls.

- If you are defining a function that will be used in a `function based index`, you must tell Oracle that the function is `DETERMINISTIC` and will return a consistent result given the same inputs.
- The **built-in SQL functions** `UPPER`, `LOWER`, and `TO_CHAR` are already defined as deterministic by Oracle so this is why you can create an index on the UPPER value of a column.

- The word “deterministic” means that the **same input** value will always produce the **same output value**.

- **Do NOT create** a deterministic function which contains a `SELECT` statement on data which may be **modified in the future**.

---

## Bulk Binding

- Many PL/SQL blocks contain both PL/SQL statements and SQL statements, each of which is executed by a different part of the Oracle software called the `PL/SQL Engine` and the `SQL Engine`.

  - A change from one engine to the other is called a context switch, which has assocated overhead and takes time.

- `FETCH` (in a cursor) is a `SQL statement` because it **accesses** database tables, but the **processing** is done by `PL/SQL statements`.

  - Remember that in a cursor `FOR loop`, **all the fetches are still executed** even though we do not explicitly code a FETCH statement.

- `Bulk Binding`:

  - fetch all the rows in a single call to the SQL Engine.
  - need an `INDEX BY table` of records to store all the fetched rows.

- `Bulk Binding` is a trade-off: **more memory** required (possibly bad) but **faster execution** (good).

---

### Bulk Binding a SELECT: `BULK COLLECT`

- `BULK COLLECT`: provides bulk processing for `SELECT` and `FETCH` statements.

- When using `BULK COLLECT`, we do not declare a cursor because we do not fetch individual rows one at a time.
- Instead, we SELECT the whole database table into the PL/SQL `INDEX BY table` in a single SQL statement.

- 总体思想:

  - cursor 需要 fetch, 无论是 loop-fetch 还是 for-loop, 需要在不同引擎中分别处理 sql 和 plsql
  - bulk collect 是不使用 cursor,而是使用 index by table, 先使用 sql 引用将数据存储在 index 中(index 是 plsql 所以整体存储只涉及一次.), 再在 plsql 引擎下处理数据.因为只涉及一次跨引擎,所以提高效率.

- Example:

  ```sql
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
  ```

---

### Bulk Binding with DML: `FORALL`

- Bulk binds can also improve the performance when loading collections from queries.

- to speed up DML statements which process many rows
- combine `BULK COLLECT` and `FORALL`.

  - Since no columns are specified in the INSERT statement, the record structure of the collection must match the table exactly

- 整体思路:

  - for loop 插入数据时, for loop 是 plsql 引擎, insert 是 sql 引擎,涉及巨量的引擎转换, 耗时.
  - 使用 bulk select,整体复制数据,是 plsql 引擎; forall 是将每行的 index 转为表结构, 随后的插入是 sql 引擎, 提高效率.

- Example: insert

  ```sql
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
  ```

- Example: Delete

  ```sql
  CREATE OR REPLACE PROCEDURE update_emps IS
      TYPE t_emp_id IS
          TABLE OF employees.employee_id%type INDEX BY BINARY_INTEGER;
      v_emp_id_tab t_emp_id;
  BEGIN
      SELECT employee_id BULK COLLECT INTO v_emp_id_tab
      FROM employees;
      -- FORALL
      FORALL i IN v_emp_id_tab.first..v_emp_id_tab.last
          UPDATE new_employees
          SET
              salary = salary * 1.05
          WHERE
              employee_id = v_emp_id_tab(
                  i
              );
  END update_emps;
  ```

---

### Bulk Binding Cursor Attributes

#### `SQL%BULK_ROWCOUNT`

- In addition to implicit cursor attributes such as `SQL%ROWCOUNT`, Bulk Binding uses two extra cursor attributes, which are both INDEX BY tables.

- `SQL%BULK_ROWCOUNT(i)` shows the number of rows processed by the ith execution of a DML statement when using FORALL.

- Example:

  ```sql

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

  ```

---

#### `SQL%BULK_EXCEPTIONS`

- The violating rows populate an `INDEX BY table` called `SQL%BULK_EXCEPTIONS` which has two fields:

  - `ERROR_INDEX` shows which inserts failed (first, second,…)
  - `ERROR_CODE` shows the Oracle Server predefined error code

- The `FORALL` statement includes an optional `SAVE EXCEPTIONS` clause that allows bulk operations to save
  exception information and continue processing.
- Once the operation is complete, the exception information can be retrieved using the `SQL%BULK_EXCEPTIONS` attribute.
- This is a collection of exceptions for the most recently executed FORALL statement, with the following two fields for each exception:

  - `SQL%BULK_EXCEPTIONS(i).ERROR_INDEX`
  - `SQL%BULK_EXCEPTIONS(i).ERROR_CODE`

- Exampel:

  ```sql
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

  ```

---

## `RETURNING` Clause

- 业务需要在 dml 之后 query 数据, 但需要两个 sql statement, DQL 和 DML
- 使用 RETURNING 可以在单一语句中实现.

- Example: returning for one

  ```sql
  CREATE OR REPLACE PROCEDURE update_one_emp (
      p_emp_id IN employees.employee_id%type
    , p_salary_raise_percent IN NUMBER
  ) IS
      v_new_salary employees.salary%type;
  BEGIN
      UPDATE employees
      SET
          salary = salary * (
              1 + p_salary_raise_percent
          )
      WHERE
          employee_id = p_emp_id RETURNING salary INTO v_new_salary;
      dbms_output.put_line('New salary is: ' || v_new_salary);
  END update_one_emp;
  ```

- Example: Returning for all

  ```sql
  CREATE OR REPLACE PROCEDURE update_all_emps (
      p_salary_raise_percent IN NUMBER
  ) IS
      TYPE t_empid IS
          TABLE OF employees.employee_id%type INDEX BY BINARY_INTEGER;
      TYPE t_sal IS
          TABLE OF employees.salary%type INDEX BY BINARY_INTEGER;
      v_empidtab t_empid;
      v_saltab   t_sal;
  BEGIN
      SELECT employee_id BULK COLLECT INTO v_empidtab
      FROM employees;
      FORALL i IN v_empidtab.first..v_empidtab.last
          UPDATE employees
          SET
              salary = salary * (
                  1 + p_salary_raise_percent
              )
          WHERE
              employee_id = v_empidtab(
                  i
              ) RETURNING salary BULK COLLECT INTO v_saltab;
  END update_all_emps;
  ```

---

[TOP](#plsql---performance)
