[Back](../../index.md)

# 目录
[TOC]


# In

- Return a set of data matching a list of given benchmark

- The list of given benchmark must be enclosed in parentheses and separated by commas.
    使用括号包围;多个给定值时用逗号分隔；

```sql

SELECT column_name(s)
FROM table_name
WHERE column_name IN (value1,value2,...);

```
- 给定的value必须完全匹配，包括字符串，数字，和日期.

- 等价于一些列的`OR=`语句

```sql

-- Equivalent

SELECT title
    ,pubid
FROM books
WHERE pubid IN (1,3,5);
	
SELECT title
    ,pubid
FROM books
WHERE pubid =1 OR pubid = 3 OR pubid = 5;

```


待实验:
1. 数据类型混合
2. 表达式
3. 取反

## NOT IN 取反

- 例子:

```sql

SELECT firstname
    ,lastname
    ,state
FROM customers
WHERE state in ('GA','FL');

NOT IN
SELECT firstname
    ,lastname
    ,state
FROM customers
WHERE state NOT IN ('GA','FL');

```

- Equivalence等价于: 一系列的`AND<>`语句

```sql

SELECT column_name(s)
FROM table_name
WHERE column_name NOT IN (v1,v2,...);

SELECT column_name(s)
FROM table_name
WHERE column_name <> v1 
AND column_name <> v2 
...;


```

