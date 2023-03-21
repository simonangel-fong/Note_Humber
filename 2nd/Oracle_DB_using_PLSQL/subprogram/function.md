# PLSQL Function

[Back](../index.md)

- [PLSQL Function](#plsql-function)
  - [Function](#function)
  - [Creating a Function](#creating-a-function)
  - [Invoke (or Execute) Functions](#invoke-or-execute-functions)
  - [Example: Is valid id](#example-is-valid-id)
  - [Benefits and Restrictions](#benefits-and-restrictions)
  - [Differences/Similarities Between Procedures and Functions](#differencessimilarities-between-procedures-and-functions)
  - [System-defined functions \& User-defined functions](#system-defined-functions--user-defined-functions)
  - [Advantages of Functions in SQL Statements](#advantages-of-functions-in-sql-statements)
  - [Restrictions on Using Functions in SQL Statements](#restrictions-on-using-functions-in-sql-statements)

---

## Function

- A `function` is a named PL/SQL block (subprogram) that can accept optional `IN` parameters and **must return exactly one value**.
- `Functions` must be called as part of a `SQL` or `PL/SQL` expression.
- In SQL expressions, a function must obey specific rules to control side effects.
- Avoid the following within functions:

  - Any kind of `DML` or `DDL`
  - `COMMIT` or `ROLLBACK`
  - Altering global variables

- A function must have a `RETURN` clause <u>in the header</u> and at least one `RETURN` statement <u>in the executable section</u>.

---

## Creating a Function

- The header for a function is like a `PROCEDURE` header with two differences:
  - The parameter mode should only be `IN`.
  - The `RETURN` clause is used instead of OUT mode.
  - can use `RETURN` from the **executable section** and/or from the `EXCEPTION` section

```sql
CREATE [OR REPLACE] FUNCTION function_name
    [(parameter1 [mode1] datatype1, ...)]
RETURN datatype
IS|AS
    [local_variable_declarations; …]
BEGIN
-- actions;
RETURN expression;
END [function_name];

```

- A function must **return a single value**.
  - must provide a `RETURN` statement to return a value with a **data type** that is consistent with the function declaration type.

```sql
-- Function

CREATE OR REPLACE FUNCTION lab_square(
    p_int NUMBER
) RETURN NUMBER IS
BEGIN
    RETURN p_int*p_int;
END;
/

DECLARE
BEGIN
    dbms_output.put_line(lab_square(2));
END;
```

---

## Invoke (or Execute) Functions

- Three ways:

  - As part of **PL/SQL expressions**: use a local variable in an **anonymous block** to hold the returned value from a function.

    - When invoking a function as part of a PL/SQL expression, you can **use a local variable to store** the returned result.

    ```sql
    -- Function

    CREATE OR REPLACE FUNCTION lab_square(
        p_int NUMBER
    ) RETURN NUMBER IS
    BEGIN
        RETURN p_int*p_int;
    END;
    /

    -- invoking a function as part of a PL/SQL expression,
    DECLARE
        v_result NUMBER;
    BEGIN
        v_result :=lab_square(2);
        dbms_output.put_line(v_result);
    END;

    ```

  - As a **parameter to another subprogram**: pass functions between subprograms.

    ```sql
    -- Invoking a Function as a Parameter in Another Subprogram
    DECLARE
    BEGIN
        dbms_output.put_line(lab_square(10));
    END;

    ```

  - As an **expression in a SQL** statement: invoke a function as any other single-row function in a SQL statement.

    - the stored function is not allowed to perform any `DML` statements before the `RETURN` statement in that function.
    - When a function is used in a SQL statement, it **executes once for each row** processed by the statement, just like Oracle-defined, single-row functions such as UPPER, LOWER, ROUND, and so on.

    ```sql
    -- Invoking a Function as an Expression in a SQL Statement
    -- 400
    SELECT lab_square(20)
    FROM dual;

    ```

---

## Example: Is valid id

```sql
-- Function

CREATE OR REPLACE FUNCTION lab_emp_isvalid(
    p_emp_id NUMBER
) RETURN BOOLEAN IS
    v_emp_id lab_emp.emp_id%type;
BEGIN
    SELECT emp_id INTO v_emp_id
    FROM lab_emp
    WHERE emp_id = p_emp_id;
    RETURN true;
EXCEPTION
    WHEN no_data_found THEN
        RETURN false;
    WHEN OTHERS THEN
        RETURN NULL;
END;
/

DECLARE
    v_lab_emp_id lab_emp.emp_id%type :=2;
BEGIN
    IF lab_emp_isvalid(v_lab_emp_id) THEN
        dbms_output.put_line('true'); -- true
    END IF;
END;
```

---

## Benefits and Restrictions

| Benefits                                                                                                                                                                     | Restrictions                                                                                                                                                  |
| ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Try things quickly: Functions allow you to temporarily display a value in a new format: a different case, annually vs. monthly (times 12), concatenated, or with substrings. | PL/SQL types do not completely overlap with SQL types. What is fine for PL/SQL (for example, BOOLEAN, RECORD) might be invalid for a SELECT.                  |
| Extend functionality: Add new features, such as spell checking and parsing.                                                                                                  | PL/SQL sizes are not the same as SQL sizes. For instance, a PL/SQL VARCHAR2 variable can be up to 32 KB, whereas a SQL VARCHAR2 column can be only up to 4 KB |

---

## Differences/Similarities Between Procedures and Functions

| Procedures                                                     | Functions                                  |
| -------------------------------------------------------------- | ------------------------------------------ |
| Execute as a PL/SQL statement                                  | Invoked as part of an expression           |
| Do not contain RETURN clause in the header                     | Must contain a RETURN clause in the header |
| May return values (if any) in output parameters (not required) | Must return a single value                 |
| May contain a RETURN statement without a value                 | Must contain at least one RETURN statement |

- Both can have zero or more IN parameters that can be passed from the calling environment.
- Both have the standard block structure including **exception handling**.

- Procedure

  - A procedure does not have to return a value.
  - A procedure can call a function to assist with its actions.

- Functions
  - to compute a value that must be returned to the calling environment.
  - Functions return **only a single value**, and the value is returned through a `RETURN` statement.
  - The functions used in `SQL` statements **cannot use OUT or IN OUT modes**.
  - Although a function using `OUT` can be invoked from a PL/SQL procedure or anonymous block, it cannot be used in SQL statements.

---

## System-defined functions & User-defined functions

- Most system functions, such as UPPER, LOWER, and LPAD are stored in a **package** named `SYS.STANDARD`.
  - These system functions are often called `built-in functions`.

---

## Advantages of Functions in SQL Statements

- If used in the `WHERE` clause of a `SELECT` statement, functions can **increase efficiency** by insuring all of the desired rows are returned.

  - Example: `SELECT * FROM employees WHERE UPPER(last_name) = UPPER('TAylor');`

- Functions in SQL statements can also manipulate data values.

- User-defined functions can extend SQL where activities are too complex, too awkward, or unavailable with regular SQL.

---

## Restrictions on Using Functions in SQL Statements

- To use a user-defined function within a SQL statement, the function must conform to the **rules and restrictions** of the SQL language.

  - The function can accept only valid SQL datatypes as `IN` parameters, and must `RETURN` a valid SQL datatype.
  - PL/SQL-specific types, such as `BOOLEAN` and `%ROWTYPE` are **not allowed**.
  - SQL **size limits** must not be exceeded (PL/SQL allows a VARCHAR2 variable to be up to 32 KB in size, but prior to Oracle 12c, SQL allowed only 4 KB).
  - `User-defined functions` may use positional, named, and mixed notation for identifying arguments.
  - Parameters for `system functions` must be specified with **positional notation**.

    - Error: `SELECT employee_id, UPPER(arg1 => last_name) FROM employees;`

  - Functions called from a `SELECT` statement **cannot contain DML statements**.
  - Functions called from an `UPDATE` or `DELETE` statement on a table **cannot query or contain DML** on the same table.
  - Functions called from any `SQL` statement **cannot end transactions** (that is, cannot execute COMMIT or ROLLBACK operations).
  - Functions called from any `SQL` statement cannot issue `DDL` (for example, CREATE TABLE) or `DCL` (for example, ALTER SESSION) because they also do an implicit `COMMIT`.

---

[TOP](#plsql-function)
