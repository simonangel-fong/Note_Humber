# Select Out Join

[Back](../../index.md)

[TOC]

---

## Outer Joins

- The keywords `OUTER JOIN` instructs Oracle 11g to include a record in the output even though there is no matching record in the corresponding table. 即使不匹配也显示数据.

---

### Traditional Method: Outer Join Operator

- An outer join can be created either in the WHERE clause with an **outer join operator** `(+)` or by using the `OUTER JOIN` keywords. `(+)`标记外联结的表, 置于 where 语句的列名之后.
  <br>

```SQL

SELECT A.column, B.column...
FROM table1 A, table2 B
WHERE A.column = B.column(+) --该处B表是匹配的表

```

- Rules:

  1. The **outer join operator** can only be used for one table in the joining condition. The outer join operator cannot be used on **both** sides of the joining condition at the same time. 只能标记一个表.
     <br>
  2. A condition that includes the outer join operator cannot use the `IN` or the `OR` operator because that would imply that a row should be shown if it matches a row in the other table or if it matches another given condition. 不能用于 IN 或 OR 语句.
     <br>

---

### JOIN Method

> - 连接的结果可以在逻辑上看作是由 SELECT 语句指定的列组成的新表。
> - 左连接与右连接的左右指的是**以两张表中的哪一张为基准**，它们都是外连接。
> - 外连接就好像是为非基准表<u>添加了一行全为空值的万能行</u>，用来与基准表中找不到匹配的行进行匹配。
> - 假设两个没有空值的表进行左连接，左表是基准表，左表的所有行都出现在结果中，右表则可能因为无法与基准表匹配而出现是空值的字段。

#### LEFT OUTER JOIN

- `LEFT (OUTER) JOIN`：Returns **all records** from the **left** table, and the _matched records_ from the _right table_. 显示所有左表,和匹配的右表记录.

![left_join](../../pic/select/join_left_join.gif)

- Syntax:

```SQL

SELECT A.column, B.column...
FROM table1 A LEFT OUTER JOIN table2 B
ON A.common_col = B.common_col;

```

---

#### RIGHT OUTER JOIN

- `RIGHT (OUTER) JOIN`：Returns **all records** from the **right table**, and the _matched records_ from the _left table_. 显示所有右表,和匹配的左表记录.

![right_join](../../pic/select/join_right_join.gif)

- 不常用, 因为和左联结相通. 一般使用左联结.

- Syntax:

```SQL

SELECT A.column, B.column...
FROM table1 A Right OUTER JOIN table2 B
ON A.common_col = B.common_col;

```

---

#### FULL OUTER JOIN

- `FULL (OUTER) JOIN`: Returns **all records** when there is a match in _either left or right table_. 显示左右表所有数据.

![full_join](../../pic/select/join_full_join.gif)

- Syntax:

```SQL

SELECT A.column, B.column...
FROM table1 A FULL OUTER JOIN table2 B
ON A.common_col = B.common_col;

```

---

[Top](#select-out-join)
