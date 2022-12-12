# GROUP BY Clause

[Back](../../index.md)

[TOC]

---

## `GROUP BY`

- `GROUP BY` 语句用于结合聚合函数，根据一个或多个列对结果集进行分组。

  - `GROUP BY` 解决的是 Group function 不能和列名共同 Query 的问题. 如果没有 GROUP BY, Group function 只能在 Query 中返回单一结果; 适用了 Group BY, 则 Group function 可以和列名结合返回多列多行结果.

  - **作用**: Group BY 支出分组的依据, Group function 是在各个分组进行计算. 输出结果是在分组指明的列名的字段中逐行列出结果.

- Syntax:

```SQL

SELECT column_name, aggregate_function(column_name)
FROM table_name
WHERE column_name operator value
GROUP BY column_name;

```

- **Rule**:

  - If a group function is used in the `SELECT` clause, then any **individual columns** listed in the `SELECT` clause **must also be listed** in the `GROUP BY` clause. 在 select 中出现列名,必须在 GROUP BY 语句列出.
  - Columns used to group data in the `GROUP BY` clause do not have to be listed in the SELECT clause. They are only included in the `SELECT` clause to have the groups identified in the output. 在 GROUP BY 语句出现的列名不一定需要在 SELECT 语句中列出.
  - Column aliases cannot be used in the `GROUP BY` clause. 别名不能再 GROUP BY 语句中出现.

- **排序**: 不涉及排序. Results returned from a `SELECT` statement that include a `GROUP BY` clause are **not listed in any order**. To present the results in a particular sequence, use the `ORDER BY` clause.

- **使用**: 对于没有分组意义的列适用 group function,即该列的数据无分组必要,即使 group function 和 GROUP BY 都符合语法要求和输出结果,但该用法也是无意义的.

### JOIN

```SQL
-- JOIN情况下的Group By
SELECT a.col1, b.col2 SUM(a.col * a.col) "Alias"  --列出结果需要的列名和多列函数
FROM tbA a JOIN tbB b ON (a.colcommon = b.colcommon) --指出联结的条件
GROUP BY a.col1, b.col2  --指出需要分组的列名,注意该处col1和col2必须列出,因为他们都在SELECT语句中出现
ORDER BY a.col1, b.col2; --排序

```

---

[TOP](#group-by-clause)
