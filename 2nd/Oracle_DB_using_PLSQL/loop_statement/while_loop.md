# While Loop

[TOC]

---

## `WHILE`

- Syntax:

```sql
WHILE condition LOOP
    --statement1;
    --statement2;

END LOOP;
```

- 执行：
  - condition:
    - Condition is a Boolean variable or expression (TRUE, FALSE, or NULL)
    - Infinite Loop: When the condition always is true.
    - The condition is evaluated at the start of each iteration.
    - If the condition is `FALSE` or `NULL` at the initial execution of the loop, then no iterations are performed.不满足条件则不会发生迭代。
  - Iteration:
    - The loop terminates when the condition is `FALSE` or `NULL`. 空值都停止迭代

### EXAMPLE

```sql
-- wk:04
-- Demo: WHILE loop


DECLARE
    v_count NUMBER(2) :=1;
BEGIN
    WHILE v_count <= 5 LOOP
        DBMS_OUTPUT.PUT_LINE('Loop exectuion #'||v_count);
        v_count := v_count + 1;
    END LOOP;

END;

--Loop exectuion #1
--Loop exectuion #2
--Loop exectuion #3
--Loop exectuion #4
--Loop exectuion #5

```

---

[TOP](#while-loop)
