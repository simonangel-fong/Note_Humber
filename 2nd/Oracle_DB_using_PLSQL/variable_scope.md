# PL/SQL Variable Scope

[back](./index.md)

---

- [PL/SQL Variable Scope](#plsql-variable-scope)
  - [Nested Blocks](#nested-blocks)
  - [Variable Scope](#variable-scope)
  - [Local and Global Variables](#local-and-global-variables)
  - [Variable Naming](#variable-naming)
  - [Qualifying an Identifier](#qualifying-an-identifier)
  - [Accessibility](#accessibility)

---

## Nested Blocks

- `Nested blocks`: blocks of code **placed within** other blocks of code.

  - PL/SQL is a block-structured language.
    The **basic units (procedures, functions, and anonymous blocks)** are logical blocks, which can contain any number of **nested sub-blocks**. Each logical block corresponds to a problem to be solved.

- There is no practical limit to the depth of nesting Oracle allows.

- `Outer block(parent block)`
- `Inner block(children block)`

---

## Variable Scope

- The `scope of a variable` is the **block or blocks in which the variable is accessible**, that is, where it can be used.
- In PL/SQL, a `variable’s scope` is the **block in which it is declared plus all blocks nested within the declaring block**. 声明+嵌套

---

## Local and Global Variables

- Variables declared in a PL/SQL block are considered **local** to that block and **global** to all blocks nested within it.

- PL/SQL first looks for a local variable in the inner block with that name. If there are no similarly named variables, PL/SQL looks for the variable in the outer block. 本地变量优先

- **PL/SQL does not look downward into the child blocks.** 同名变量，本地优先，只会向上查找，不会向下查找。

- Accessibility: 内部代码块可以访问外部变量； 外部代码块不能访问内部变量。

```sql

DECLARE
    V_FIRST_NAME VARCHAR2(20);#Global
BEGIN
    DECLARE
        V_LAST_NAME VARCHAR2(20);#Local
    BEGIN
        V_FIRST_NAME := 'Carmen';
        V_LAST_NAME := 'Miranda';
        DBMS_OUTPUT.PUT_LINE (V_FIRST_NAME || ' ' || V_LAST_NAME);
    END;
    DBMS_OUTPUT.PUT_LINE (V_FIRST_NAME || ' ' || V_LAST_NAME); #Error, V_LAST_NAME is a local variable which is not accessible in the outer block.
END;

```

---

## Variable Naming

- cannot declare two variables with **the same name in the same block**.
  - However, you can declare variables with the same name in two different blocks when one block is nested within the other block.
- The two items represented by the same name are distinct, and any change in one does not affect the other.

---

## Qualifying an Identifier

- A `qualifier` is a **label given to a block**. `<<label_name>>`
  - You can use this qualifier to access the variables that have scope but are not visible.
  - Each nested inner block also can be labeled.

```sql

<<OUTER>> --qualifier
DECLARE
    V_FATHER_NAME   VARCHAR2(20):='Patrick';
    V_DATE_OF_BIRTH DATE:='20-Apr-1972';
BEGIN
    DECLARE
        V_CHILD_NAME    VARCHAR2(20):='Mike';
        V_DATE_OF_BIRTH DATE:='12-Dec-2002';
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Father''s Name: ' || V_FATHER_NAME);
        DBMS_OUTPUT.PUT_LINE('Date of Birth: ' || OUTER.V_DATE_OF_BIRTH); -- the outer variable can be accessible with qualifier.
        DBMS_OUTPUT.PUT_LINE('Child''s Name: ' || V_CHILD_NAME);
        DBMS_OUTPUT.PUT_LINE('Date of Birth: ' || V_DATE_OF_BIRTH);
    END;
END;

-- Father's Name: Patrick
-- Date of Birth: 20-APR-72
-- Child's Name: Mike
-- Date of Birth: 12-DEC-02

```

---

## Accessibility

- 内部代码块：

  - 有同名变量，使用内部变量
  - 有同名变量，使用 qualifier 调用外部变量
  - 没有同名变量，向上查找

- 外部代码块：

  - 有同名变量，使用外部变量
  - 不能使用内部变量

```sql

DECLARE
    V_FATHER_NAME   VARCHAR2(20):='Patrick';
    V_DATE_OF_BIRTH DATE:='20-Apr-1972';
BEGIN
    DECLARE
        V_CHILD_NAME    VARCHAR2(20):='Mike';
        V_DATE_OF_BIRTH DATE:='12-Dec-2002';
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Father''s Name: ' || V_FATHER_NAME);
        DBMS_OUTPUT.PUT_LINE('Date of Birth: ' || V_DATE_OF_BIRTH); --12-DEC-02
        DBMS_OUTPUT.PUT_LINE('Child''s Name: ' || V_CHILD_NAME);
    END;
    DBMS_OUTPUT.PUT_LINE('Date of Birth: ' || V_DATE_OF_BIRTH);     --20-APR-72
END;

-- Father's Name: Patrick
-- Date of Birth: 12-DEC-02
-- Child's Name: Mike
-- Date of Birth: 20-APR-72

```

---

[TOP](#plsql-variable-scope)
