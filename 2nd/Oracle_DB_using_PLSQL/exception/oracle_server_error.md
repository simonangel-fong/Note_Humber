# Oracle Server Errors

[Back](../index.md)

- [Oracle Server Errors](#oracle-server-errors)
  - [Types of Oracle Server Errors](#types-of-oracle-server-errors)
  - [Functions associated error code or error message](#functions-associated-error-code-or-error-message)
    - [Example](#example)
  - [Predefined Oracle server errors](#predefined-oracle-server-errors)
    - [Example](#example-1)
  - [Non-predefined Oracle server errors](#non-predefined-oracle-server-errors)
    - [Example](#example-2)

---

## Types of Oracle Server Errors

- When an `Oracle server error` occurs, the Oracle server **automatically raises** the associated exception, **skips the rest of the executable section** of the block, and **looks for a handler** in the exception section

- Oracle server errors can be `predefined` or `non-predefined`.

| Type           | Error Number | Error Name     |
| -------------- | ------------ | -------------- |
| Predefined     | yes          | Predefined     |
| Non-predefined | yes          | Not predefined |

---

## Functions associated error code or error message

- `SQLERRM`: returns character data containing the **message** associated with the error number.

- `SQLCODE`: returns the numeric value for the **error code**. (You can assign it to a NUMBER variable.)

| SQLCODE Value   | Description                        |
| --------------- | ---------------------------------- |
| `0`             | No exception encountered           |
| `1`             | User defined exception             |
| `+100`          | `NO_DATA_FOUND` exception          |
| Negative number | Another Oracle Server error number |

- **Practise**:
  - You cannot use `SQLCODE` or `SQLERRM` directly in an SQL statement.
  - Instead, you must assign their values to **local variables**, then use the variables in the SQL statement,

### Example

```sql

-- 实用代码,记录user name和错误的number, 错误信息

DROP TABLE plsql_log;

-- create a log table to store error record
CREATE TABLE plsql_log(
    user_name VARCHAR2(144)
  , login date
  , err_msg VARCHAR2(512)
  , err_num NUMBER(5)
);

DECLARE
    e_insert_excep EXCEPTION;
    PRAGMA exception_init(e_insert_excep, -01400); --associate the exception name with the exception nubmer
    v_err_num      NUMBER(8);
    v_err_msg      VARCHAR(100);
BEGIN
    INSERT INTO plsql_copy_dep VALUES (
        1000
      , NULL
    );
    dbms_output.put_line('Insert completed.'); --not executed due to exception
EXCEPTION
    WHEN e_insert_excep THEN
        v_err_num :=sqlcode;    -- assign error code to a local variable
        v_err_msg :=sqlerrm;    -- assign error message to a local variable
        INSERT INTO plsql_log VALUES(
            user
          , sysdate()
          , v_err_msg
          , v_err_num
        );                      -- insert error record into the log table
        dbms_output.put_line( 'cannot insert NULL into Name column' );
END;

```

---

## Predefined Oracle server errors

- Each of these errors has a **predefined name**, in addition to a standard **Oracle error number** (ORA-#####) and message.

- Sample:
  - `NO_DATA_FOUND`
  - `TOO_MANY_ROWS`
  - `INVALID_CURSOR`
  - `ZERO_DIVIDE`
  - `DUP_VAL_ON_INDEX`

### Example

```sql

DECLARE
    v_lname employees.last_name%type;
BEGIN
    SELECT last_name INTO v_lname
    FROM employees
    WHERE last_name LIKE 'a%';
    dbms_output.put_line(v_lname); --the code that will not be executed, due to exception.
EXCEPTION
    WHEN too_many_rows THEN --Oracle pre-defined exception
        dbms_output.put_line('Multiple rows returned!');
    WHEN no_data_found THEN --Oracle pre-defined exception
        dbms_output.put_line('No record contain last name starting with "a"!');
    --error, appear in at most one exception handler
    -- WHEN no_data_found THEN
    --     dbms_output.put_line('No record contain last name starting with "a"!');
    WHEN OTHERS THEN
        dbms_output.put_line('Error Number: '||sqlcode);    -- display error code
        dbms_output.put_line('Error Message: '||sqlerrm);   -- display error message
END;

```

---

## Non-predefined Oracle server errors

- Each of these errors has a **standard Oracle error number** (ORA-#####) and error message, but **not a predefined name**.

  - Non-predefined exceptions are similar to predefined exceptions, except they **do not have predefined names**.
  - They do have a standard Oracle **error number** (ORA-#####) and **error message**.

- You **declare your own names** for these so that you can reference these names in the exception section.

- Syntax:

```sql

DECLARE
    exception_name EXCEPTION;
    PRAGMA exception_init(exception_name, error_number);
BEGIN
        --plsql code
EXCEPTION
    WHEN exception_name THEN
        --exception handler code
END:

```

- 代码解释:

  - `PRAGMA EXCEPTION_INIT` tells the compiler to associate an **exception name** with a specific **Oracle error number**.

  - error_number list:
    - https://docs.oracle.com/database/121/DRDAS/error_code.htm#DRDAS514

### Example

```sql

DECLARE
    e_delete EXCEPTION;     --define non-predefined error
    PRAGMA exception_init(e_delete, -02292);    -- associate exception name with error number
    v_dpt_id  departments.department_id%type :=10;
    v_err_num NUMBER(8);
    v_err_msg VARCHAR(100);
BEGIN
    DELETE FROM departments
    WHERE
        department_id=v_dpt_id;     -- try to delete a record that violates foreign key contraint
EXCEPTION
    WHEN e_delete THEN              -- trap/catch error
        v_err_num :=sqlcode;
        v_err_msg :=sqlerrm;
        dbms_output.put_line('integrity constraint violation');
        dbms_output.put_line('Error Number: '||v_err_num);
        dbms_output.put_line('Error Message: '||v_err_msg);
END;

```

---

[TOP](#oracle-server-errors)
