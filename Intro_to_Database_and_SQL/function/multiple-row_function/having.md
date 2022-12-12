# `HAVING` Clause

[Back](../../index.md)

[TOC]

---

## `HAVING`

- The `HAVING` clause is used to **restrict groups** returned by a query

- 对比:

  - The `WHERE` clause restricts the records that will **appear in the query**.
    - the `WHERE` clause cannot contain any **grouping functions**. where 不能使用聚合函数
  - The `HAVING` clause will **specify which groups** will be displayed in the results. The `HAVING` clause is a `WHERE` clause for groups
    - Having 可以使用聚合函数
  - 在 SQL 中增加 HAVING 子句原因是，WHERE 关键字无法与聚合函数一起使用。HAVING 子句可以让我们筛选分组后的各组数据。

- Syntax:

```SQL

SELECT column_name, aggregate_function(column_name)
FROM table_name --该处可以使用JOIN ON进行连接
WHERE column_name operator value
GROUP BY column_name
HAVING aggregate_function(column_name) operator value; --having可以使用聚合函数
-- AND additional having_condition; --可以使用AND增加条件
```

- **使用**:

  - 如果同时涉及筛选条件, 分组, 分组条件时, 三个语句的顺序:

    1. `WHERE`
    2. `GROUP`
    3. `HAVING`

  - 计算顺序:

    - The `WHERE` clause filters the data **before grouping**, whereas the `HAVING` clause filters the groups **after** the grouping occurs. 先 where 过滤, 再 having 过滤
    - 性能问题 efficiency: 虽然 where 和 having 都能限制条件,但如果将条件放在 having,则会对全部的结果进行聚合函数再筛选,增加额外运算.

  - 思考思路:
    1. 是否需要筛选 - `WHERE`;
    2. 是否需要使用聚合函数 - `GROUP BY`;
    3. 是否需要对分组进行限制 - `HAVING`;

---

[TOP](#having-clause)
