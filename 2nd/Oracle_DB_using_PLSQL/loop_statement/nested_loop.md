# Nested Loop

[Back](../index.md)

[TOC]

--

## Nested Loop

```sql

-- wk:04
-- Demo: Nested Loop


DECLARE
BEGIN
    FOR V_INNER_COUNT IN 1..5 LOOP
        FOR V_OUTER_COUNT IN REVERSE 1..5 LOOP
            DBMS_OUTPUT.PUT_LINE('Inner count #'||V_INNER_COUNT||'; Outer count #'||V_OUTER_COUNT);
        END LOOP;
    END LOOP;
END;

-- Inner count #1; Outer count #5
-- Inner count #1; Outer count #4
-- Inner count #1; Outer count #3
-- Inner count #1; Outer count #2
-- Inner count #1; Outer count #1
-- Inner count #2; Outer count #5
-- Inner count #2; Outer count #4
-- Inner count #2; Outer count #3
-- Inner count #2; Outer count #2
-- Inner count #2; Outer count #1
-- Inner count #3; Outer count #5
-- Inner count #3; Outer count #4
-- Inner count #3; Outer count #3
-- Inner count #3; Outer count #2
-- Inner count #3; Outer count #1
-- Inner count #4; Outer count #5
-- Inner count #4; Outer count #4
-- Inner count #4; Outer count #3
-- Inner count #4; Outer count #2
-- Inner count #4; Outer count #1
-- Inner count #5; Outer count #5
-- Inner count #5; Outer count #4
-- Inner count #5; Outer count #3
-- Inner count #5; Outer count #2
-- Inner count #5; Outer count #1

```

---

## Nested Loop Label

- Loop label names follow the same rules as other identifiers.

- A label is placed before a statement, either on the **same** line or on a **separate** line.

```sql
-- wk:04
-- Demo: Nested Loop Label

DECLARE
BEGIN
    <<outer_loop>>--Label
    FOR V_INNER_COUNT IN 1..3 LOOP
        <<inner_loop>>--Label
        FOR V_OUTER_COUNT IN REVERSE 1..3 LOOP
            DBMS_OUTPUT.PUT_LINE('Inner count #'||V_INNER_COUNT||'; Outer count #'||V_OUTER_COUNT);
        END LOOP inner_loop;--Label
    END LOOP outer_loop;--Label
END;

-- Inner count #1; Outer count #3
-- Inner count #1; Outer count #2
-- Inner count #1; Outer count #1
-- Inner count #2; Outer count #3
-- Inner count #2; Outer count #2
-- Inner count #2; Outer count #1
-- Inner count #3; Outer count #3
-- Inner count #3; Outer count #2
-- Inner count #3; Outer count #1
```

## 难点：exit后出现的label

- exit 后加不同的标签会推出不同的 loop

```sql

-- wk:04
-- Demo: Nested Loop Label

-- DECLARE
-- BEGIN
--     <<outer_loop>>
--     FOR V_INNER_COUNT IN 1..3 LOOP
--         <<inner_loop>>
--         FOR V_OUTER_COUNT IN REVERSE 1..3 LOOP
--             DBMS_OUTPUT.PUT_LINE('Inner count #'||V_INNER_COUNT||'; Outer count #'||V_OUTER_COUNT);
--             EXIT inner_loop WHEN V_INNER_COUNT = 2; --label： inner loop
--         END LOOP inner_loop;
--     END LOOP outer_loop;
-- END;

-- Inner count #1; Outer count #3
-- Inner count #1; Outer count #2
-- Inner count #1; Outer count #1
-- Inner count #2; Outer count #3  因为exit放再innerloop的最后，所以会至少执行一次
-- Inner count #3; Outer count #3
-- Inner count #3; Outer count #2
-- Inner count #3; Outer count #1

DECLARE
BEGIN
    <<outer_loop>>
    FOR V_INNER_COUNT IN 1..3 LOOP
        <<inner_loop>>
        FOR V_OUTER_COUNT IN REVERSE 1..3 LOOP
            DBMS_OUTPUT.PUT_LINE('Inner count #'||V_INNER_COUNT||'; Outer count #'||V_OUTER_COUNT);
            EXIT outer_loop WHEN V_INNER_COUNT = 2; --label： outer loop
        END LOOP inner_loop;
    END LOOP outer_loop;
END;

-- Inner count #1; Outer count #3
-- Inner count #1; Outer count #2
-- Inner count #1; Outer count #1
-- Inner count #2; Outer count #3 因为exit放再innerloop的最后，所以会至少执行一次

```

## 难点：inner loop的相对位置

```sql

-- wk:04
-- Demo: Nested Loop Label

DECLARE
    V_OUTER_COUNT NUMBER;
    V_INNER_COUNT NUMBER;
BEGIN
    V_OUTER_COUNT :=1;
    <<outer_loop>>
    LOOP
        V_INNER_COUNT :=1;
        V_OUTER_COUNT:=V_OUTER_COUNT+1;  --before inner
        EXIT WHEN V_OUTER_COUNT>3; -- before inner

        <<inner_loop>>
        LOOP
            DBMS_OUTPUT.PUT_LINE('Inner count #'||V_INNER_COUNT||'; Outer count #'||V_OUTER_COUNT);
            V_INNER_COUNT:=V_INNER_COUNT+1;
            EXIT WHEN V_INNER_COUNT>3;
        END LOOP inner_loop;

    END LOOP outer_loop;
END;
 -- Inner count #1; Outer count #2  因为outer先+1，后输出
 -- Inner count #2; Outer count #2
 -- Inner count #3; Outer count #2
 -- Inner count #1; Outer count #3 
 -- Inner count #2; Outer count #3
 -- Inner count #3; Outer count #3


DECLARE
    V_OUTER_COUNT NUMBER;
    V_INNER_COUNT NUMBER;
BEGIN
    V_OUTER_COUNT :=1;
    <<outer_loop>>
    LOOP
        V_INNER_COUNT :=1;
        

        <<inner_loop>>
        LOOP
            DBMS_OUTPUT.PUT_LINE('Inner count #'||V_INNER_COUNT||'; Outer count #'||V_OUTER_COUNT);
            V_INNER_COUNT:=V_INNER_COUNT+1;
            EXIT WHEN V_INNER_COUNT>3;
        END LOOP inner_loop;

        V_OUTER_COUNT:=V_OUTER_COUNT+1;--after inner loop
        EXIT WHEN V_OUTER_COUNT>3;--after inner loop
    END LOOP outer_loop;
END;

-- Inner count #1; Outer count #1 因为先inner输出，再outer+1
-- Inner count #2; Outer count #1
-- Inner count #3; Outer count #1
-- Inner count #1; Outer count #2
-- Inner count #2; Outer count #2
-- Inner count #3; Outer count #2
-- Inner count #1; Outer count #3
-- Inner count #2; Outer count #3
-- Inner count #3; Outer count #3

```


---

[TOP](#nested-loop)
