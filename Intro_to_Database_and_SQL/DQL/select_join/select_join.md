# Select Join Statement

[Back](../../index.md)

[TOC]

---

## Join

A `JOIN` clause is used to **combine rows** from <u>two or more tables</u>, based on a related column between them.

## Types of Joins

![sql-join](../../pic/select/sql-join.png)

---

## Oracle Explain Plans

- 使用`EXPLAIN PLAN FOR`显示结构

```SQL

EXPLAIN PLAN FOR
-- SELECT JOIN CODES

SELECT *
FROM TABLE(DBMS_XPLAN.DISPLAY);

```

---

[Top](#select-join-statement)
