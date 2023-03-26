# PLSQL Function

[Back](../index.md)

- [PLSQL Function](#plsql-function)
  - [Function](#function)
    - [Creating a Function](#creating-a-function)
    - [View Source Code of Function](#view-source-code-of-function)
    - [List functions](#list-functions)
    - [Drop Functions](#drop-functions)
    - [Invoke (or Execute) Functions](#invoke-or-execute-functions)
      - [As part of PL/SQL expressions](#as-part-of-plsql-expressions)
      - [As a parameter to another subprogram](#as-a-parameter-to-another-subprogram)
      - [As an expression in a SQL statement](#as-an-expression-in-a-sql-statement)
    - [Example: Is valid id](#example-is-valid-id)
  - [Types of functions](#types-of-functions)
  - [Usage of Function in SQL Statements](#usage-of-function-in-sql-statements)
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

- A function must have a `RETURN` clause <u>in the header</u> and **at least one** `RETURN` statement <u>in the executable section</u>.

- In PL/SQL expressions, the function identifier **acts like a variable** whose value depends on the parameters passed to it.

---

### Creating a Function

- **Syntax**:

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

- Parameter:

  - The parameter mode should only be `IN`.
  - Example of functions without parameter:
    - `USER`
    - `SYSDATE`

- `Return`:

  - `Return` clause before `IS`
  - Must has `Return` clause in **executable section** and/or from the **EXCEPTION section**.
  - must **return a single value**.
  - <u>data type of value</u> must be consistent with the <u>function declaration type</u>.

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

### View Source Code of Function

- use `USER_SOURCE` table

```sql
-- get source code of a function
SELECT text
FROM user_source
WHERE type = upper('function')
  AND name = upper('get_tax')
ORDER BY line;
```

---

### List functions

- User `user_procedures` data Dict:

  ```sql
  -- user_procedures:只包括valid
  SELECT object_name
  , object_type
  , authid
  FROM user_procedures
  WHERE object_type = upper('function')
  ORDER BY object_name;
  ```

- User `user_objects` data Dict:

  ```sql
  -- user_objects: 包括invalid
  SELECT object_name
  , object_type
  , TIMESTAMP
  , status
  FROM user_objects
  WHERE object_type = upper('function')
  ORDER BY object_name;
  ```

- 使用`user_source`:
  ```sql
  -- return number of function
  SELECT COUNT(DISTINCT name)
  FROM user_source
  WHERE type = upper('function');
  ```

- User `all_procedures` data Dict:

  ```sql
  -- all_procedures:
  -- 返回sys 的函数
  SELECT COUNT(*)
  FROM all_procedures
  WHERE owner = upper('sys')
    AND object_type=upper('function');

  SELECT object_name
  , owner
  , object_type
  , authid
  FROM all_procedures
  WHERE owner = upper('sys')
    AND object_type=upper('function')
  ORDER BY object_name;

  -- all_procedures:
  -- 返回user 的函数, 只包括valid
  SELECT object_name
  , owner
  , object_type
  , authid
  FROM all_procedures
  WHERE owner = upper('n01555914')
    AND object_type=upper('function')
  ORDER BY object_name;
  ```

---

### Drop Functions

```sql
DROP FUNCTION procedure_name;

```

---

### Invoke (or Execute) Functions

#### As part of PL/SQL expressions

- use a local variable in an **anonymous block** to hold the returned value from a function.
  - can **use a local variable to store** the returned result.

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

---

#### As a parameter to another subprogram

- pass functions between subprograms.

```sql
-- Invoking a Function as a Parameter in Another Subprogram
DECLARE
BEGIN
    dbms_output.put_line(lab_square(10));
END;

```

---

#### As an expression in a SQL statement

- invoke a function as any other single-row function in a SQL statement.

- When a function is used in a SQL statement, it **executes once for each row** processed by the statement,

```sql
-- Invoking a Function as an Expression in a SQL Statement
-- 400
SELECT lab_square(20)
FROM dual;

```

- the stored function is not allowed to perform any `DML` statements before the `RETURN` statement in that function.
- When a function is used in a SQL statement, it **executes once for each row** processed by the statement, just like Oracle-defined, single-row functions such as UPPER, LOWER, ROUND, and so on.

---

### Example: Is valid id

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

## Types of functions

- `built-in functions`: functions provided by <u>Oracle</u> and stored in `SYS.STANDARD` **package**.

- `user-defined function`: functions that are created by the PL/SQL <u>programmer</u>.

---

## Usage of Function in SQL Statements

### Advantages of Functions in SQL Statements

- If used in the `WHERE` clause of a `SELECT` statement, functions can **increase efficiency** by insuring all of the desired rows are returned.

  - Example: `SELECT * FROM employees WHERE UPPER(last_name) = UPPER('TAylor');`

- Functions in SQL statements can also **manipulate** data values.

- User-defined functions can extend SQL where activities are too complex, too awkward, or unavailable with regular SQL.

- can be used **anywhere** a value or expression is needed.

---

### Restrictions on Using Functions in SQL Statements

- PL/SQL **types** do not completely overlap with SQL types.返回的数据类型限制

  - example: `BOOLEAN` and `%ROWTYPE` are **not allowed** in SQL.

- PL/SQL **sizes are not the same as** SQL sizes.长度限制

  - example: VARCHAR2 variable in PLSQL can be up to 32 KB in size, but prior to Oracle 12c, SQL allowed only 4 KB.

- Parameter notation:

  - `User-defined functions` may use positional, named, and mixed notation for identifying arguments.
  - `system functions` must **only use positional notation**.
    - Error: `SELECT employee_id, UPPER(arg1 => last_name) FROM employees;`

- Statement Restrictions

| SQL Statement               | Function Statement                     | Error          |
| --------------------------- | -------------------------------------- | -------------- |
| `SELECT` statement          | **No** `DML`, `DDL`statement           |                |
| `UPDATE`,`DELETE` statement | **No** `DML` statement or **QUERY**    | mutating table |
| ANY                         | **No** (implicit) `COMMIT`, `ROLLBACK` |                |

- Calls to subprograms that break these restrictions are also not allowed in a function.当被其他子程序调用时,也不能违反.

---

[TOP](#plsql-function)
