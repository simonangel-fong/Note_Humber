[Back](../index.md)

# CHECK 检查条件

[TOC]

---

## Check 

- A `CHECK` constraint requires that a **specific condition be met** before a record can be added to a table 检查输入是否符合设定条件<br>
    With a CHECK constraint, you can make sure a book’s price is greater than 0, its retail price is less than $200.00, or a seller’s commission rate is less than 50%<br>
    You could check to make the sure the order date is earlier or equal to the ship date 

- However, the condition **cannot reference built-in functions** such as `SYSDATE`, `USER`, or `ROWNUM` or <u>refer to values stored in **other rows**</u>. <br>不能使用内建函数或引用其他行的记录。

- It can be compared to values within the **same row** 

- `Check` constraints must evaluate to `TRUE` or `FALSE`<br>CHECK只能判断true或false
    - Logical operators `AND` and `OR` can be used 逻辑运算符
        - `(columnname = 'str') OR (columnname = 'str')`
    - Ranges are also permitted 范围
        - `columnname IN ('str1','str2')`
    - Compare with other column 与其他列比较
        - `columnname > columanname1`

## Stored Data





---

## Create

### Column Level

```sql

CREATE TABLE tablename
(
    columnname datatype(width) CONSTRAINT tablename_columnname_ck CHECK (condition),
)

```

### Table Level

```sql

CREATE TABLE tablename
(
    -- column definition
 CONSTRAINT tablename_columnname_ck CHECK (condition),
)

```

---

## Alter

- If any records already stored in the table violate the `CHECK` condition , Oracle will return an `error` message that the constraint has been violated and the ALTER TABLE command will fail

- Find the offending records by the command<br>
    `SELECT * FROM table WHERE not_condition`<br>
   Then fix the records.

### ADD

```sql

ALTER TABLE tablename
ADD CONSTRAINT tablename_columnname_ck CHECK (condition);

```

### DROP

```sql
ALTER TABLE tablename
DROP CONSTRAINT constraintname;

```

---

[TOP](#check-检查条件)
