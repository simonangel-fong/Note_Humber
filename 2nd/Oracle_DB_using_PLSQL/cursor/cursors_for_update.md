# Cursors for Update

[Back](../index.md)

- [Cursors for Update](#cursors-for-update)
  - [Purpose](#purpose)
  - [FOR UPDATE](#for-update)
  - [WHERE CURRENT OF](#where-current-of)
    - [Example: WHERE CURRENT OF](#example-where-current-of)
  - [FOR UPDATE OF column-name](#for-update-of-column-name)
    - [Example: FOR UPDATE OF](#example-for-update-of)

---

## Purpose

- We can lock rows as we open the cursor in order to prevent
  other users from updating them. 目的: 当使用游标时,将行锁定,以排除其他用户修改数据.
  - An open cursor provides a **read-consistent** view of the data fetched by the cursor. 保持数据一致性.
- Any updates made by other users since the cursor was opened will not be seen when we fetch the rows, even if the updates were committed.注意: 对查询用户, 查询返回的数据不受查询期间的修改影响; 对修改的用户, 数据修改也可以提交; 目的是保持查询用户看到数据的一致性.不影响修改用户的操作.

- Our session would have to close and re-open the cursor in order to see the committed updates.对查询用户, 如果需要获取最新提交的数据,则需要关闭并重新打开游标.

- Does not prevent other users from reading the rows.不影响其他查询者.

---

## FOR UPDATE

- The FOR UPDATE clause specifies that the cursor should be updatable, and enforces a check during compilation that the SELECT statement meets the requirements for an updatable cursor. 摘自 oracle doc.
- When we declare a cursor `FOR UPDATE`, **each row** is **locked** as we **open** the cursor. 打开游标时,每一行都锁定, 不只是某一行或某一列.

  - prevents other users from **modifying the rows** while our cursor is **open**. 修改行不能.

- Syntax:

```sql

-- Syntax: cursor for update

DECLARE
    CURSOR cursor_name IS
        SELECT column_name
        FROM table_name FOR UPDATE OF column_reference NOWAIT;
BEGIN
 -- open cursor
END;

```

- `WHERE CURRENT OF`

  - allows us to modify the rows ourselves

- `column_reference`

  - a column in the table whose rows we need to lock.需要锁定的列

- `NOWAIT` | `WAIT num_sec`:
  - If the rows have already been locked by another session
  - `NOWAIT`:
    - returns an Oracle server **error immediately** 马上返回错误.
    - Control is immediately returned to your program. 可以马上进行其他操作.
  - `WAIT n_second`: **waits for n seconds**, and returns an Oracle server **error** if the other session is still locking the rows at the end of that time. 等候指定秒数,如果需要访问的数据还上锁,则返回错误.
  - If **omitting** the NOWAIT keyword, the Oracle server waits **indefinitely** until the rows are available. 默认无期限等待,直到响应.

---

## WHERE CURRENT OF

- The `WHERE CURRENT OF` clause is used in the `UPDATE`
  or `DELETE` statement, whereas the `FOR UPDATE` clause
  is specified in the **cursor declaration**.

  - where current of 用在修改和删除语句;
  - for update 用在游标声明;

  - to reference the current row from an explicit cursor. 指代当前的列.即游标中的列.
  - to apply updates and deletes to the row currently being addressed, **without** the need to use a `WHERE` clause.因为指代,所以无需再 where 中指明 udpata 和 delete 的条件.

- 适用场景: 游标中的 update/delete 语句;
- 作用: 指代当前游标的列.

- Syntax:

```sql
UPDATE table_name
    SET column01 = value01
    WHERE CURRENT OF cursor_name;
```

---

### Example: WHERE CURRENT OF

```sql

--Demo: cursor for update where current

-- Example
-- CREATE TABLE copy_employee AS (
--   SELECT employee_id
-- , first_name
-- , last_name
-- , salary FROM employees
-- );

-- SELECT *
-- FROM copy_employee;

DECLARE
  CURSOR cur_copy_emp IS
    SELECT employee_id
    , salary
    FROM copy_employee FOR UPDATE NOWAIT;  --for update: indicates the cursor is updatable; NOWAIT: instructs return error immediately
  rec_emp cur_copy_emp%rowtype; -- declares a record to store a row of data for cursor's each iteration.
BEGIN
  OPEN cur_copy_emp;
  LOOP
    FETCH cur_copy_emp INTO rec_emp;
    EXIT WHEN cur_copy_emp%notfound;
    UPDATE copy_employee            --update statement
    SET
      salary =rec_emp.salary*2
    WHERE
      CURRENT OF cur_copy_emp;      --refer to the current row of the cursor. If missing this, the the update statement will apply to all rows.
  END LOOP;
  CLOSE cur_copy_emp;
END;

```

---

## FOR UPDATE OF column-name

- If the cursor is based on a join of two tables, we may want to lock the rows of one table but not the other.
- 使用场景: join; 效果: 锁定指定表.

- Syntax:

```sql

 -- Syntax: FOR UPDATE OF column-name
DECLARE
    CURSOR cursor_name IS
        SELECT col_1
          , col_2
        FROM tb_1 t1
          , tb_2 t2
        WHERE tb_1.pk = tb_2.pk FOR UPDATE OF t1.col_2 NOWAIT; --tb_1 is lock
BEGIN
 -- open cursor
END;

```

---

### Example: FOR UPDATE OF

```sql

DECLARE
  CURSOR cur_join IS
    SELECT
      e.first_name
    , e.last_name
    , e.salary
    , d.department_name
    FROM
      copy_emp    e
      JOIN copy_depart d
      ON e.department_id = d.department_id FOR UPDATE OF salary NOWAIT;
      -- for update can be used with join on; of col_name: to lock the table copy_emp of the column salary.
BEGIN
  FOR v_rec_join IN cur_join LOOP
 -- dbms_output.put_line(v_rec_join.salary);
    UPDATE copy_emp
    SET
      salary=v_rec_join.salary*1.5
    WHERE
      CURRENT OF cur_join; --reference the currunt row of cursor
  END LOOP;
END;

```

---

[TOP](#cursors-for-update)
