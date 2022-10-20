[Back](../../index.md)

# 目录

[TOC]

# ORDER BY

- To display the results of query in sorted order.
    排序显示

- 排序后于where,排序的前提是有selection，没有where的selection，不能order
    ORDER BY clause is listed at the end of the SELECT statement.

- Column alias, if applied, can be used in ORDER BY clause.
    可以使用别名

- The limit on the number of columns that can be used in the ORDER BY caluse is 255.
    最多能显示255列

- Syntax:

```sql

SELECT column_name,column_name
FROM table_name
ORDER BY column_name,column_name ASC|DESC;

```

## ASC 升序

The output is sorted in ascending sequence by default.

ASC keyword is usually used to eliminate any possible confusion.

Values are listed in the order of:
    - Blank and special characters空白或特殊字符
    - Numeric values数字
    - Character values字符
    - NULL values

```sql

-- display output in descending sequence
SELECT field_name(s)
FROM table_name
ORDER BY field_name ASC;

```

***

## DESC 降序

The output is sorted in descending sequence when using `DESC`.

```sql

-- display output in descending sequence
SELECT field_name(s)
FROM table_name
ORDER BY field_name DESC;

```

***

# Treatment of NULL

- By default, nul values are listed last.

- `NULLS FIRST`: Null values are listed first.

- `NULLS LAST`: Null values are listed last.

***

# Secondary Sort

可以使用第二的列名用于次级排序。

- 多列排序:
    - Sort by the primary column name;
    - Then sort by the secondary column name;

***

# Sort by column ordinals

使用列序号column ordinal

列序号指是SELECT语句中的field_name的排序,序号从1开始。


