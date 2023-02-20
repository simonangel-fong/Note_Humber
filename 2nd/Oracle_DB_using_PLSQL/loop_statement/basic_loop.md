# Basic Loops

[Back](../index.md)

- [Basic Loops](#basic-loops)
  - [Structure](#structure)
    - [Example](#example)

---

## Structure

- Syntax:

```sql

LOOP
    -- statements;
    EXIT WHEN condition;
END LOOP;

```

- 语法：

  - between the keywords `LOOP` and `END LOOP`

  - `EXIT`:
    - 相当于`IF THEN EXIT`
    - Without the `EXIT` statement, the loop would never end (an infinite loop) 必须有 exit，否则无限循环
    - must be placed **inside** a loop
    - If at the top of the loop and it is true, statements in the loop never execute.
    - can contain **multiple** EXIT statements.

- 执行：
  - allows the execution of its statements at least once, even if the `EXIT` condition is already met upon entering the loop. 至少执行一次
  - 效果相当于 do...while.

---

### Example

```sql

-- wk:04
-- Demo: Basic Loop


DECLARE
    v_count NUMBER(2) :=1;
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE('Loop exectuion #'||TO_CHAR(V_COUNT));
        V_COUNT := V_COUNT+1;
        EXIT WHEN V_COUNT >5;
    END LOOP;
END;

--Loop exectuion #1
--Loop exectuion #2
--Loop exectuion #3
--Loop exectuion #4
--Loop exectuion #5

```

---

[TOP](#basic-loops)
