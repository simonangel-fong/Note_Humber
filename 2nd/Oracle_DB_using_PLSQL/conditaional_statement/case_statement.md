# Case Statement

[TOC]

---

## `CASE` Statement Structure

- For **Equality** conditions

- Syntax:

```sql

CASE selector
   WHEN value1 THEN
        -- Statement 1;
   WHEN value2 THEN
        -- Statement 2;
   WHEN value3 THEN
        -- Statement 3;
   ELSE  -- default case
        -- Statement default;
END CASE;

```

### Example

```sql
-- wk:04
-- For: case statement

DECLARE
    v_grade CHAR(1) :='B';
    v_txt   VARCHAR2(20);
BEGIN
    CASE v_grade
        WHEN 'A' THEN
            v_txt := 'Excellent';
        WHEN 'B' THEN
            v_txt :='Very good';
        WHEN 'C' THEN
            v_txt :='Well done';
        WHEN 'D' THEN
            v_txt :='You passed';
        WHEN 'F' THEN
            v_txt :='Better try again';
        ELSE --Default case
            v_txt :='No such grade';
    END CASE;
    DBMS_OUTPUT.PUT_LINE(v_txt); --Very good
END;

```

---

## Searched `CASE` Statements

- For **Equality** conditions: `>`,`<`,`!=`.
- The syntax is virtually identical to an equivalent `IF` statement. 语法上与 if 类似，效果等效。

```sql

CASE
    WHEN v_num > value1 THEN
        --statement 1;
    WHEN v_num > value2 THEN
        --statement 2;
    ELSE -- Default case
        -- statement default;
END CASE;

```

---

## `CASE` Expression

- it selects **one** of a number of <u>results</u> and assigns it to a <u>variable</u>. 是一个返回单一值的表达式

- Syntax：

```sql

variable_name :=
    CASE selector
        WHEN expression1 THEN result1
        WHEN expression2 THEN result2
        WHEN expressionN THEN resultN
        ELSE resultDefault --default result
    END;

```

- 语法：
  - THEN 后的语句不需要加分号
  - 整个 case expression 是一个语句,所以只有一个分号
  - case 表达式以 END 结束，不是 END CASE。
- Expression：
  - 可以是一个静态的值如 1，2，'A', 也可以是一个动态的变量或函数，如 v_x，sysdate。
  - 一旦其中一个 expression 是 true 将不会匹配其他 expression,所以顺序很重要
  - 只适用于 equality condition，即 expression 是一个给定值。如果是一个范围，如大小于，则使用 searched CASE expression。
  - 与 case expression 相比，返回的值可以是任何数字类型。

### Example

```sql

-- wk:04
-- Demo: case expression

DECLARE
    v_grade CHAR(1) :='B';
    v_txt   VARCHAR2(20);
BEGIN
    v_txt := --assign a value to variable
        CASE V_GRADE
            WHEN 'A' THEN 'Excellent' -- no semi-colon
            WHEN 'B' THEN 'Very good'
            WHEN 'C' THEN 'Well done'
            WHEN 'D' THEN 'You passed'
            WHEN 'F' THEN 'Better try again'
            ELSE 'No such grade'
        END; -- not end case; only one semi-colon ending the expresion
    DBMS_OUTPUT.PUT_LINE(V_TXT); --Very good
END;

```

---

## Searched CASE Expression

- Searched `CASE` expressions allow **non-equality** conditions, **compound** conditions, and different variables to be used in different `WHEN` clauses. 不相等条件，复合条件，多变量

- Syntax：

```sql
variable_name :=
    CASE
        WHEN search_condition1 THEN result1
        WHEN search_condition2 THEN result2
        WHEN search_conditionN THEN resultN
        ELSE default_result
    END;
```

- 语法：
  - A searched CASE expression has **no selector**.
- Search_condition
  - its WHEN clauses contain search conditions that yield a `Boolean` value, not expressions that can yield a value of any type. 只能返回一个布尔值。

---

## Example

```sql
-- wk:04
-- Demo: searched case expression
-- 本例中可以使用等于，IN(); 由于大小写，所以只能返回else
DECLARE
    v_grade CHAR(1) :='B';
    v_txt   VARCHAR2(20);
BEGIN
    v_txt := --assign a value to variable
        CASE -- no selector

            WHEN V_GRADE='A' THEN 'Excellent' -- no semi-colon
            WHEN V_GRADE IN ('b','C') THEN 'Very good'--case sensitive
            WHEN V_GRADE='D' THEN 'You passed'
            WHEN V_GRADE='F' THEN 'Better try again'
            ELSE 'No such grade'
        END; -- not end case; only one semi-colon ending the expresion
    DBMS_OUTPUT.PUT_LINE(V_TXT); --No such grade
END;

```

---

## Difference: Case statement & Case expression

- CASE statements

  - CASE statements evaluate conditions and perform actions.执行
  - CASE statements end with END CASE; 结束
  - A CASE statement can contain many PL/SQL statements.多语句

- CASE expressions

  - CASE expressions return a value into a variable.用于返回值到变量
  - CASE expressions end with END; 结束
  - A CASE expression is a single PL/SQL statement. 单一语句

---

[TOP](#case-statement)
