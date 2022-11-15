# Cartesian Join/Cross Join

[Back](../../index.md)

[TOC]

---

## Cartesian Join / Cross Join 笛卡尔连接

- In a **`Cartesian Join`** (also called a `Cartesian Product`笛卡尔乘积 or a `Cross Join`), each record in the first table is matched with a record from the second table
  <br>

- Every row of one table is joined to every row of the second table. So it joins every row with every possible combination of records. 总数是两个集合元素个数的乘积.
  <br>

- In the absence of a `WHERE` condition the `CARTESIAN JOIN` will behave like a `CARTESIAN PRODUCT` 原因是缺少 where 语句.
  <br>

- In the presence of `WHERE` condition this `JOIN` will function like a `INNER JOIN`有 where 语句时,相当于内联结.
  <br>

- Generally speaking, Cross join is similar to an `inner join` where the join-condition will always evaluate to `True`. 相当于特殊的内联.
  <br>

---

### Traditional Method

- Syntax:

```SQL

-- Traditional Method
SELECT table1.column1 , table1.column2, table2.column1...
FROM table1, table2;

```

---

### JOIN Method

- Syntax:

```SQL

-- Cross Join
SELECT table1.column1 , table1.column2, table2.column1...
FROM table1
CROSS JOIN table2;

```

---

[TOP](#cartesian-joincross-join)
