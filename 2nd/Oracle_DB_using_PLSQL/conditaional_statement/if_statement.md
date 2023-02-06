# If Statement

[TOC]

---

## `IF` Statements Structure

- Syntax:

```sql

-- single condition
IF condition THEN
    -- statements executed if condition is true
END IF;

-- additional conditions



--
IF condition01 THEN
    -- statements executed if condition01 is true
ELSIF condition02 THEN
    -- statements executed if condition01 is true
ELSE
-- statements executed if condition01 and condition02 are false of null
END IF;


```

- **Condition**:

  - a <u>Boolean variable</u> or <u>expression</u> that returns `TRUE`, `FALSE`, or `NULL`. 包含空值。
  - The statements in the `THEN` clause are executed only if the condition in the associated `IF` clause evaluates to `TRUE`. Then 后语句的执行与 then 前的条件关联。
  - If a condition is `FALSE` or `NULL`, control then passes to the next clause. null 相当于 false.

- **Execution**:
  - `ELSIF`: **optional**. A keyword that introduces an **additional** Boolean expression.<font color="red"> not ELSEIF</font>
  - `ELSE`: **optional**. introduces the default clause that is executed **if, and only if**, <i>none</i> of the earlier conditions (introduced by IF and ELSIF) are `TRUE`.
  - `END IF`: marks the end of an IF statement and must be terminated by a semicolon. 一定要以分号结束

### Example

```sql
-- wk:04
-- For: if statement

DECLARE
    v_myage NUMBER :=31;
BEGIN
 -- if then
    IF V_MYAGE < 20 THEN
        DBMS_OUTPUT.PUT_LINE('I''m a child.'); --will not executed due to the condition
    END IF;

 -- if else
    IF V_MYAGE < 20 THEN
        DBMS_OUTPUT.PUT_LINE('I''m a child.');
    ELSE
        DBMS_OUTPUT.put_line('I''m not a child'); --this will execute
    END IF;

 -- if elsfi else
    IF v_myage <20 THEN
        DBMS_OUTPUT.PUT_LINE('I''m a child.');
    ELSIF v_myage <30 THEN
        DBMS_OUTPUT.PUT_LINE('I''m in twenties.');
    ELSIF v_myage <40 THEN
        DBMS_OUTPUT.PUT_LINE('I''m in thirties'); --this will execute
    ELSE
        DBMS_OUTPUT.PUT_LINE('I''m a mature');
    END IF;
END;
```

---

## Multiple Conditional Expression 多重条件

- Logical operators： `AND`,`OR`, `NOT`

- There is **no limitation** on the number of conditional expressions that can be used. 数量无限制

### Example

```sql
-- Demo: Multiple Conditional Expression

DECLARE
    v_age  NUMBER :=11;
    v_name VARCHAR2(20) :='Simon';
BEGIN
 -- multiple conditional expression
    IF v_age < 20 AND v_name='Simon' THEN
        DBMS_OUTPUT.PUT_LINE('I am a child named Simon');
    END IF;
END;

```

---

## `Null`

- `NULL` condition: The condition in the IF statement returns NULL, which is neither `TRUE` nor `FALSE`.
- Guidline:
  - Simple comparisons involving nulls always yield `NULL`. 简单比较如等于，大小于，一律按照 null 条件处理
  - Applying the logical operator `NOT` to a null yields `NULL`. 与 not 逻辑运算符计算的，一律返回 null
  - In conditional control statements, if a condition yields `NULL`, it behaves just like a `FALSE`, and the associated sequence of statements is **not executed**. null 条件视作 false。
  - Null的算数式的结果是Null。
    - `V_COUNT NUMBER;V_COUNT:=V_COUNT+1;`:V_COUNT依然是空。

### Exmaple

```sql
DECLARE
    v_age NUMBER;
    v_x   NUMBER;
    v_y   NUMBER;
BEGIN
 -- null condition = false
    IF v_age <20 THEN --because v_age is null, SQL regard the condition a false.
        DBMS_OUTPUT.PUT_LINE('I am a child');
    ELSE
        DBMS_OUTPUT.PUT_LINE('I am not a child'); --result: I am not a child
    END IF;
 -- null comparison
    IF v_x = v_y THEN -- comparison involved null
        DBMS_OUTPUT.PUT_LINE('x=y');
    ELSE
        DBMS_OUTPUT.PUT_LINE('null condition'); -- execute this statement
    END IF;
END;

```

---

[TOP](#if-statement)
