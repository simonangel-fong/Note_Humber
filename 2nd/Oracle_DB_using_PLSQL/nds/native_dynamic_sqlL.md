# PLSQL - Dynamic SQL

[Back](../index.md)

- [PLSQL - Dynamic SQL](#plsql---dynamic-sql)
  - [Execution Flow of SQL](#execution-flow-of-sql)
  - [Dynamic SQL](#dynamic-sql)
  - [Native Dynamic SQL](#native-dynamic-sql)
  - [EXECUTE IMMEDIATE Statement](#execute-immediate-statement)
    - [Example: NDS(DDL) in Procedure](#example-ndsddl-in-procedure)
    - [Example: NDS(DQL) in Function](#example-ndsdql-in-function)
    - [Example: NDS(DML) in Procedure](#example-ndsdml-in-procedure)
    - [Example: NDS Recompile](#example-nds-recompile)

---

## Execution Flow of SQL

- **All SQL statements** in the database go through various stages:
  - `Parse`: Pre-execution "is this possible?" <u>checks syntax, object existence, privileges</u>, and so on
  - `Bind`: Getting the **actual values** of any variables referenced in the statement
  - `Execute`: The statement is executed.
  - `Fetch`: Results are returned to the user.
- Some stages might not be relevant for all statements;

  - for example, the fetch phase is applicable to queries but not DML

- When a `SQL` statement is included in a `PL/SQL` subprogram, the `parse` and `bind` phases are normally done at `compile` time, that is, when the procedure, function, or package body is CREATEd.

- Oracle server could **not parse** SQL statement when the text of the SQL statement is not known when the procedure is created. 语句不明时,不会分析语句.

- Example:

  - 下例无法通过编译

  ```sql
  -- compilation error
  CREATE PROCEDURE DROP_ANY_TABLE(
      P_TABLE_NAME VARCHAR2
  ) IS
  BEGIN
      DROP TABLE P_TABLE_NAME; -- cannot be parsed
  END;
  ```

---

## Dynamic SQL

- `Dynamic SQL`:

  - Is constructed and stored as a character string **within a subprogram**. 存储在子程序
  - Is a **SQL statement** with varying column data, or different conditions with or without placeholders (bind variables). sql 不固定
  - Enables data-definition, data-control, or session-control statements to be written and executed from PL/SQL. 目的: DDL

- use `dynamic SQL` to create a SQL statement whose **text is not completely known in advance**.

|                         | SQL categories |
| ----------------------- | -------------- |
| embedded SQL statements | DQL,DML, TCL   |
| Dynamic SQL             | DDL, other     |

- The embedded SQL statements available in PL/SQL are limited to :

  - `SELECT`, `INSERT`, `UPDATE`, `DELETE`, `COMMIT`, and `ROLLBACK`,
  - All of which are parsed at compile time; that is, they have a **fixed structure**.

- use `Dynamic SQL` functionality if you require:

  - The **structure** of a SQL statement to be **altered** at execution time
  - Access to `DDL` statements and other SQL functionality in PL/SQL

---

## Native Dynamic SQL

- PL/SQL does **not support** `DDL` statements written directly in a program.

- `Native Dynamic SQL(NDS)`

  - allows to work around this by constructing and storing SQL <u>as a character string</u> within a subprogram.
  - Provides native support for `Dynamic SQL` directly in the PL/SQL language.
  - Enables data-definition, data-control, or session-control statements to be written and executed from PL/SQL.

- Is executed with `Native Dynamic SQL statements` (`EXECUTE IMMEDIATE`) or the `DBMS_SQL` package.
- Provides the ability to execute SQL statements whose **structure is unknown** until execution time.
- Can also use the `OPEN-FOR`, `FETCH`, and `CLOSE` PL/SQL statements.

---

## EXECUTE IMMEDIATE Statement

- `EXECUTE IMMEDIATE`:
  - A statement that prepares (parses) and immediately executes a dynamic SQL statement or an anonymous PL/SQL block.

```sql
EXECUTE IMMEDIATE dynamic_string [INTO {define_variable [, define_variable] ... | record}]
[USING [IN|OUT|IN OUT] bind_argument [, [IN|OUT|IN OUT] bind_argument] ... ];
```

- Use the `EXECUTE IMMEDIATE` statement for NDS in PL/SQL **anonymous blocks** or **subprograms**

- `dynamic_string`

  - a character variable or literal containing the **text of a SQL statement**.

- `INTO` is used for **single-row queries** and specifies the variables or records into which column values are retrieved. 赋值

  - `define_variable`
    - a PL/SQL variable that **stores a selected column value**.
  - `record`
    - a user-defined or %ROWTYPE record that stores a **selected row**.

- `USING` holds all bind arguments.

  - `bind_argument`:
    - an expression whose value is passed to the dynamic SQL statement at execution time.
    - can use numberic, character,and date literals as bind arguments
    - cannot use Boolean literals (TRUE, FALSE, NULL) 因为该实参是传递到 SQL 中,而 SQL 没有布尔类型
    - The default parameter mode is `IN`.

---

### Example: NDS(DDL) in Procedure

```sql
CREATE OR REPLACE PROCEDURE drop_any_table(
    p_table_name VARCHAR2
) IS
    v_dynamic_stmt VARCHAR2(128);
BEGIN
    v_dynamic_stmt :='drop table ' ||p_table_name;
    EXECUTE IMMEDIATE v_dynamic_stmt;
 -- EXCEPTION
 --     WHEN OTHERS THEN
 --         dbms_output.put_line('This table does not exist.')
END;
/

CREATE TABLE test_message(
    id NUMBER(6)
  , text VARCHAR2(256)
);

-- one row selected
SELECT object_name
  , object_type
FROM user_objects
WHERE object_name = upper('test_message');

/

BEGIN
    drop_any_table('test_message');
END;
/

-- no row selected
SELECT object_name
  , object_type
FROM user_objects
WHERE object_name = upper('test_message');

```

---

### Example: NDS(DQL) in Function

```sql
-- NDS function

CREATE OR REPLACE FUNCTION count_rows(
    p_table_name IN VARCHAR2
) RETURN NUMBER IS
    v_stmnt VARCHAR2(265);
    v_count NUMBER;
BEGIN
    v_stmnt := 'SELECT count(*) FROM '|| p_table_name;
    EXECUTE IMMEDIATE v_stmnt INTO v_count;
    RETURN v_count;
END;
/

SELECT COUNT(*)
FROM employees;

SELECT count_rows('employees')
FROM dual;

/

BEGIN
    dbms_output.put_line(count_rows('employees'));
END;
```

---

### Example: NDS(DML) in Procedure

```sql
-- native ds

CREATE TABLE test_message(
    id NUMBER(6)
  , text VARCHAR2(256)
);

/

CREATE OR REPLACE PROCEDURE add_row(
    p_table_name VARCHAR2
  , p_id NUMBER
  , p_name VARCHAR2
) IS
    v_stmnt VARCHAR2(200);
BEGIN
    v_stmnt :='INSERT INTO ' || p_table_name || ' VALUES(' || p_id || ', ''' || p_name || ''')';
    EXECUTE IMMEDIATE v_stmnt;
    dbms_output.put_line(sql%rowcount||' rows inserted.');
END;
/

BEGIN
    add_row('test_message', 1, 'text01');
END;
/

SELECT *
FROM test_message;

```

---

### Example: NDS Recompile

- `ALTER PROCEDURE procedure-name COMPILE;`
- `ALTER FUNCTION function-name COMPILE;`
- `ALTER PACKAGE package_name COMPILE SPECIFICATION;`
- `ALTER PACKAGE package-name COMPILE BODY;`

```sql
-- recompile

CREATE OR REPLACE PROCEDURE compile_plsql (
    p_name VARCHAR2
  , p_type VARCHAR2
  , p_options VARCHAR2 := NULL
) IS
    v_stmt VARCHAR2(200);
BEGIN
    v_stmt := 'ALTER ' || p_type || ' ' || p_name || ' COMPILE' || ' ' || p_options;
    EXECUTE IMMEDIATE v_stmt;
    dbms_output.put_line('Recompile successfully.');
END;
/

BEGIN
    compile_plsql('add_row', 'procedure');
END;
```

---

[TOP](#plsql---dynamic-sql)
