# Join Three or More Tables

[Back](../../index.md)

[TOC]

---

## Traditional Method

- Syntax:

```sql

SELECT A.column, B.column, C.column, ...
FROM table1 A, table2 B, table3 C
WHERE A.common_col1 = B.common_col1 -- 联结表A和表B
AND B.common_col2 = C.common_col2; -- 联结表A和表B

```

## JOIN Method

- Syntax:

```sql

SELECT A.column, B.column, C.column
FROM table1 A JOIN table2 B
ON A.common_col1 = B.common_col1 --联结不同表
JOIN talbe3 C
ON B.common_col2 = C.common_col2 --联结不同表
WHERE condition; --筛选条件

```

---

[TOP](#join-three-or-more-tables)
