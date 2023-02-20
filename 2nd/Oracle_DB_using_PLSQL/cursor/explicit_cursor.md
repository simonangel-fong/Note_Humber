# Explicit Cursor

[Back](../index.md)

- [Explicit Cursor](#explicit-cursor)
  - [Explicit Cursor Operations](#explicit-cursor-operations)
  - [Explicit Cursor Attributes](#explicit-cursor-attributes)
  - [Basic Syntax](#basic-syntax)
    - [Example: Basic Syntax](#example-basic-syntax)
  - [Records](#records)
    - [Example: Records](#example-records)
  - [Cursor FOR Loops](#cursor-for-loops)
    - [Exmaple: Cursor FOR Loops](#exmaple-cursor-for-loops)
  - [Cursor FOR Loops Using Subqueries](#cursor-for-loops-using-subqueries)
    - [Example: Cursor FOR Loops Using Subqueries](#example-cursor-for-loops-using-subqueries)
  - [Cursors with Parameters](#cursors-with-parameters)
    - [Example: Cursors with Parameters](#example-cursors-with-parameters)
  - [Cursor FOR Loops wıth a Parameter](#cursor-for-loops-wıth-a-parameter)
    - [Example: Cursor FOR Loops wıth a Parameter](#example-cursor-for-loops-wıth-a-parameter)
  - [Multiple Cursor](#multiple-cursor)
    - [Example: Multiple Cursor](#example-multiple-cursor)

---

## Explicit Cursor Operations

- `Active Set`: The set of rows returned by a multiple-row query and stored in the context area.
  - size is the number of rows that meet the query criteria.

## Explicit Cursor Attributes

| Attribute   | Type      | Description                                                                           |
| ----------- | --------- | ------------------------------------------------------------------------------------- |
| `%ISOPEN`   | `Boolean` | Evaluates to TRUE if the cursor is open.                                              |
| `%NOTFOUND` | `Boolean` | Evaluates to `TRUE` if the most recent fetch did not return a row.                    |
| `%FOUND`    | `Boolean` | Evaluates to `TRUE` if the most recent fetch returned a row; opposite of `%NOTFOUND`. |
| `%ROWCOUNT` | `Number`  | Evaluates to the total number of rows `FETCHed` so far                                |

- `%ROWCOUNT` and `%NOTFOUND` attributes are used in a loop to determine when to exit the loop.

  - `%ROWCOUNT`

    - To process an exact **number of rows** 累计数,可以用来指定循环次数
    - To count the number of rows fetched **so far** in a loop and/or determine when to **exit** the loop

  - `%NOTFOUND`
    - To determine whether the query **found any rows**
    - To determine when to **exit** the loop

- cannot use an explicit cursor attribute directly in an SQL statement. shold copy the cursor attribute value to a variable, then use the variable in the SQL statement.使用变量赋值属性值,尤其是属性值使用在 insert/update 语句时.

---

## Basic Syntax

```sql

-- Basic explicit cursor
DECLARE
    CURSOR cursor_name IS
        -- select_statememt;
    variable_name DATATYPE;
BEGIN
    IF NOT cursor_name%ISOPEN THEN
      OPEN cursor_name;                             -- Open cursor
    END IF;

    LOOP
        FETCH cursor_name INTO variable_name;       -- load data from the cursor
        EXIT WHEN cursor_name%NOTFOUND;             -- condition to exit loop
        -- some statements
    END LOOP;
    CLOSE cursor_name;                              -- Close cursor
END;

```

- `DECLARE`

  - **Do not** include the `INTO` clause in the cursor declaration
  - If processing rows **in a specific sequence** is required, then use the `ORDER BY` clause in the query.
  - The cursor can be any valid SELECT statement, including **joins, subqueries**, and so on.
  - If a cursor declaration references any PL/SQL **variables**, these variables must be declared **before declaring the cursor**.
  - The **active set of a cursor** is determined by the `SELECT` statement in the cursor declaration.

- `OPEN`

  - **Allocates memory** for a `context area` (creates the box to hold the data)
  - **Executes** the `SELECT` statement in the cursor declaration, returning the
    results into the `active set` (fills the box with the data)
  - **Positions the pointer** to the <u>first row</u> in the active set

- `FETCH`

  - Include the **same number of variables** in the `INTO` clause of the `FETCH` statement as columns in the `SELECT` statement, and be sure that the **data types** are compatible.
  - Match each variable to **correspond to the columns position** in the cursor definition.
  - Use `%TYPE` to insure data types are compatible between variable and table.
  - **Retrieves the rows** from the cursor <u>one at a time</u>.
  - After each successful fetch, the cursor **advances to the next row** in the `active set`.
  - After each `FETCH`, the `EXIT WHEN` checks to see if the `FETCH` reached the end of the active set. If it did, the `NOTFOUND` attribute is set to `TRUE`.
  - If the end of the active set was reached, the `LOOP` is exited.

- `CLOSE`

  - The `CLOSE` statement **releases** the `active set` of rows.
  - If you attempt to fetch data from a cursor after it has been closed, then an `INVALID_CURSOR` exception is raised.关闭后,active set 清空,则如果尝试 fetch 数据,将会异常.
  - A cursor **can be reopened** <u>only if it is closed</u>.
  - If you later reopen the cursor, the associated `SELECT` statement is **re-executed** to **re-populate the context area** with the most recent data from the database.

---

### Example: Basic Syntax

```sql
DECLARE
    CURSOR cur_depts_emps IS
        SELECT
            first_name
        FROM
            employees;
    v_fname employees.first_name%type; --use %type to ensure data type
    v_attr  NUMBER;
BEGIN
    OPEN cur_depts_emps;
    LOOP
        FETCH cur_depts_emps INTO v_fname;
        v_attr := cur_depts_emps%rowcount;
        EXIT WHEN cur_depts_emps%notfound;
        dbms_output.put_line(to_char(v_attr) ||'-' ||v_fname);
    END LOOP;
    CLOSE cur_depts_emps;
END;
```

---

## Records

- A `record`: a **composite data type**, consisting of a number of `fields` each with their own name and data type

  - `%ROWTYPE` declares a record with the same fields as the cursor on which it is based.

- Syntax:

```sql

-- Record
DECLARE
    CURSOR cursor_name IS
        -- Select statememt;
    variable_name cursor_name%ROWTYPE;
BEGIN
    IF NOT cursor_name%ISOPEN THEN
      OPEN cursor_name;                             -- Open cursor
    END IF;
    LOOP
        FETCH cursor_name INTO variable_name;       -- load data from the cursor
        EXIT WHEN cursor_name%NOTFOUND;             -- condition to exit loop
        -- some statements
        -- call field: variable_name.field
    END LOOP;
    CLOSE cursor_name;                              -- Close cursor
END;

```

---

### Example: Records

```sql

DECLARE
    CURSOR cur_emp IS
        SELECT
            *
        FROM
            employees;
    v_emp_record cur_emp%rowtype; --declare a record
BEGIN
    OPEN cur_emp; -- Open cursor
    LOOP
        FETCH cur_emp INTO v_emp_record; -- load data from the cursor
        EXIT WHEN cur_emp%notfound; -- condition to exit loop
        dbms_output.put_line(v_emp_record.first_name || ' ' ||v_emp_record.last_name ); -- use the dot notation to show field's value
    END LOOP;
    CLOSE cur_emp; -- Close cursor
END;

```

---

## Cursor FOR Loops

- A cursor `FOR` loop processes rows in an explicit cursor.

  - the cursor is **opened**,
  - a row is **fetched** once for each iteration in the loop,
  - the loop **exits** when the last row is processed,
  - and the cursor is **closed** **automatically**.

- Syntax:

```SQL

-- Explicit cursor for
DECLARE
    CURSOR cursor_name IS
        -- Select statememt;
BEGIN
    FOR record_name IN cursor_name LOOP
        -- statement;
        EXIT WHEN cursor_name%ROWCOUNT > 5;   -- statement to jump out the iteration.
    END LOOP;
END;

```

- **record_name**: the name of the implicitly declared **record**
- **cursor_name**: a PL/SQL identifier for a previously declared **cursor**

- 特点:

  - **No variables** are declared to hold the fetched data and no `INTO` clause is required.
  - `OPEN` and `CLOSE` statements are **not required**, they happen automatically in this syntax.
  - The **scope of the implicit record** is restricted to the loop, so you cannot reference the fetched data outside the loop.内部有效.
  - record 的 field 的个数与游标 select 语句中的列名数量相同.

- `EXIT WHEN` + `%ROWCOUNT`: 可以控制跳出迭代

---

### Exmaple: Cursor FOR Loops

```sql
-- Example: Explicit cursor for
DECLARE
    CURSOR cur_emp IS
        SELECT
            *
        FROM
            employees;
BEGIN
    FOR v_emp_record IN cur_emp LOOP
        dbms_output.put_line(v_emp_record.first_name ||' ' ||v_emp_record.last_name);
    END LOOP;
END;
```

---

## Cursor FOR Loops Using Subqueries

- **Advantage**:
  - the cursor definition is contained in a single FOR statement.
  - In complex code with lots of cursors, this simplification **makes code maintenance** easier and quicker.
- **Downside** :can't reference cursor attributes. 不能使用游标属性

- Syntax:

```sql

-- Explicit cursor for - Subquery
DECLARE
 -- not require to declear cursor and variable
BEGIN
    FOR RECORD_NAME IN ( /*Subquery statement*/) LOOP
    -- Statement;
    END LOOP;
END;

```

---

### Example: Cursor FOR Loops Using Subqueries

```sql

-- Example: Explicit cursor for - Subquery
DECLARE
BEGIN
    FOR rec_emp IN (
        SELECT
            *
        FROM
            employees
    ) LOOP
        dbms_output.put_line(rec_emp.first_name ||' ' ||rec_emp.last_name);
    END LOOP;
END;

```

---

## Cursors with Parameters

- A `parameter` is a variable whose name is used in a cursor declaration.

  - When the cursor is opened, the parameter value is **passed to** the Oracle server, which uses it to decide which rows to retrieve into the active set of the cursor.
  - can open and close an explicit cursor several times in a block, or in different executions of the same block, returning a **different** active set on each occasion.

- Syntax:

```sql

-- Explicit cursor parameter
DECLARE
    CURSOR cursor_name (parameter_name datatype) IS
        -- Select statememt;
    variable_name cursor_name%ROWTYPE;
BEGIN
    OPEN cursor_name(literal_value);                -- Open cursor
    LOOP
        FETCH cursor_name INTO variable_name;       -- load data from the cursor
        EXIT WHEN cursor_name%NOTFOUND;             -- condition to exit loop
        -- some statements
        -- call field: variable_name.field
    END LOOP;
    CLOSE cursor_name;                              -- Close cursor
END;

```

- **cursor_name**: a PL/SQL identifier for the declared cursor
- **parameter_name**: the name of a parameter
  - pass parameter values to a cursor when the cursor is **opened**.
  - **do not** give parameter **size**
- **datatype**: the **scalar data type** of the parameter
- **select_statement**: a `SELECT` statement without the `INTO` clause

---

### Example: Cursors with Parameters

```sql
DECLARE
    CURSOR c_name(v_id employees.employee_id%type) IS
        SELECT
            first_name
          , last_name
        FROM
            employees
        WHERE
            employee_id=v_id;
    v_max_id employees.employee_id%type;
    v_fname  employees.first_name%type;
    v_lname  employees.last_name%type;
BEGIN
    SELECT
        MAX(employee_id) INTO v_max_id
    FROM
        employees;
    OPEN c_name(v_max_id);
    LOOP
        FETCH c_name INTO v_fname, v_lname;
        EXIT WHEN c_name%notfound;
        dbms_output.put_line(v_fname ||' ' ||v_lname);
    END LOOP;
    CLOSE c_name;
END;

```

---

## Cursor FOR Loops wıth a Parameter

- Syntax:

```sql
-- Syntax: cursor for with parameters
DECLARE
    CURSOR cursor_name(parameter_name datatype) IS
        -- Select statment
BEGIN
    FOR record_name IN cursor_name(arguement_value) LOOP
        --Statement;
        EXIT WHEN cursor_name%ROWCOUNT > 5; --optional, to jump out the iteration
    END LOOP;
END;
```

### Example: Cursor FOR Loops wıth a Parameter

```sql

-- Exameple: cursor for with parameter
DECLARE
    CURSOR c_name (v_id employees.employee_id%type) IS
        SELECT
            first_name
          , last_name
        FROM
            employees
        WHERE
            employee_id=v_id;
    v_max_id employees.employee_id%type;
BEGIN
    SELECT
        MAX (employee_id) INTO v_max_ids
    FROM
        employees;
    FOR rec_name IN c_name(v_max_id) LOOP
        dbms_output.put_line(rec_name.first_name || ' ' || rec_name.last_name);
    END LOOP;
END;

```

---

## Multiple Cursor

to produce multi-level reports

- One common example is the need for multi-level reports in which each level of the report uses rows from different cursor. these cursors are related to each other by **parameters**.

### Example: Multiple Cursor

```sql


-- Example1:
DECLARE
    CURSOR cur_dep IS
        SELECT
            department_name
          , department_id
        FROM
            departments
        ORDER BY
            department_name;
    CURSOR cur_emp(v_dep_id departments.department_id%type) IS
        SELECT
            first_name
          , last_name
        FROM
            employees
        WHERE
            department_id = v_dep_id
        ORDER BY
            last_name;
BEGIN
    <<deparment>>
    FOR v_rec_dep IN cur_dep LOOP
        <<employee>>
        FOR v_rec_emp IN cur_emp(v_rec_dep.department_id) LOOP
            dbms_output.put_line(v_rec_dep.department_name||' - ' || v_rec_emp.first_name||' '||v_rec_emp.last_name);
        END LOOP employee;
    END LOOP deparment;
END;

/

-- Example2:
DECLARE
    CURSOR cur_loc IS
        SELECT
            location_id
          , street_address
          , city
        FROM
            locations
        ORDER BY
            city;
    CURSOR cur_dep(v_loc_id locations.location_id%type) IS
        SELECT
            department_name
        FROM
            departments
        WHERE
            location_id = v_loc_id
        ORDER BY
            department_name;
BEGIN
    <<loation>>
    FOR v_rec_loc IN cur_loc LOOP
        <<department>>
        FOR v_rec_dep IN cur_dep(v_rec_loc.location_id) LOOP
            dbms_output.put_line(v_rec_loc.street_address||', ' || v_rec_loc.city||' - '||v_rec_dep.department_name);
        END LOOP department;
    END LOOP loation;
END;

```

---

[TOP](#explicit-cursor)
