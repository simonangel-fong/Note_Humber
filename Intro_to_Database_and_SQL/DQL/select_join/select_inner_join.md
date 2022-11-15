# Select Inner Join

[Back](../../index.md)

[TOC]

---

## Inner Join

- `(INNER) JOIN`：Returns records that have matching values in both tables. 返回两表匹配的值,相当于交集 intersection.

![inner_join](../../pic/select/join_inner_join.gif)

- When performing , a row is returned if there was a corresponding record in each table queried.

- The **Equality Join**, **Non-Equality Join** and **Self-Joins** are all classified as **inner joins** because records are only <u>returned if a match is found in each table</u>内联结是指返回匹配的数据. 不匹配的不会返回.
  <br>

- The default keyword `INNER` can be included with the `JOIN` keyword to specify that only the records having a matching row in the corresponding table should be returned in the results. 可以使用关键字`INNER`.
  <br>

- 进行`SELECT JOIN`时, 无论是哪种方法,都要在**列名 column name**前标明标明**表名 table name**, 避免报错. 特别是对**共同列 common column**.
  <br>

- `SELECT JOIN`可以使用表别名 table alias.

---

## Equality Join

- The most common type of join used in the workplace uses two or more tables with **equivalent data stored in a common column**. 原因是两表存在相等值在共同列.
  <br>

- A **common column** is a column with equivalent data that exists in two or more tables.
  <br>

---

### Traditional Method: `WHERE`

- Syntax:

```SQL

SELECT table1.column1, table2.column2, ...
FROM table1, table2
WHERE table1.common_col = table2.common_col;

```

---

### JOIN Method: `JOIN ON`

- Uses `ON` clause to specify which fields are related.

- Using the `ON` clause in a `SELECT` statement allows you to use the `WHERE` clause exclusively for restricting the rows to be included in the results. 使用 ON 语句可以让 WHERE 语句专门用于限定行.

```SQL

SELECT table1.column1, table2.column2, ...
FROM table1 INNER JOIN table1
ON table1.common_col = table2.common_col;

```

---

### Other Method

#### `NATURAL JOIN`

- The `NATURAL` keyword implies that the two specified tables have at least one column in common with the same name and datatype. 两个表至少存在一个共同列.
  <br>

- 语法上无需指明共同列, 会自动匹配.
  <br>

- 不能使用列名
  <br>

- Sytax

```SQL

SELECT table1.column1, table2.column2, ...
FROM table1 NATURAL JOIN table2;

```

---

#### `JOIN USING`

- The `USING` clause requires a **commonly named column** to perform the join.

- Sytax

```SQL

SELECT A.column1, common_column, B.column2, ...
FROM tableA A JOIN tableB B
USING (common_column);

```

---

## Non-Equality Joins

- A **non-equality join** is used when the related columns cannot be joined through an <u>equal sign</u>. 不是相等值
  <br>

- Instead of finding a **column-to-column match**, you use the `non-equality join` to determine whether the weight of the item falls between the minimum and maximum **ranges** of the columns. 不是行-行匹配,是范围的匹配.
  <br>

### Traditional Method: `SELECT WHERE BETWEEN`

- Syntax:

```SQL

SELECT A.column1, B.column2, ...
FROM table1 A, table2 B
WHERE A.common_col BETWEEN B.max_col AND B.min_col;

```

---

### JOIN Method: `JOIN ON BETWEEN`

```SQL

SELECT A.column1, B.column2, ...
FROM table1 A INNER JOIN table2 B
ON A.common_col BETWEEN B.max_col AND B.min_col;

```

---

## Self-Joins

- Applied when the data in a table references other data stored in the same table. 引用相同表.

- Method:
  - **Traditional method**:
    - `SELECT FROM WHERE =`using table aliases
  - **Join Method**:
    - `JOIN ON`using table aliases

### Traditional Method: `SELECT FROM WHERE =`

- Syntax:

```SQL

SELECT A.column1, A.column2, ...
FROM table1 A, table1 B --自联结, 两个表名相同
WHERE A.common_ref = B.common_id;

```

---

### JOIN Method: `JOIN ON BETWEEN`

```SQL

SELECT A.column1, B.column2, ...
FROM table1 A INNER JOIN table1 B
ON A.common_ref = B.common_id;

```

---

[Top](#select-inner-join)
