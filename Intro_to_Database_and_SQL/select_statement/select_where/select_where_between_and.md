[Back](/index.md)

# 目录
[TOC]

# BETWEEN AND

- Return a set of data in a range between a given low boudary and a given high boundary, in stead of comparied with a given benchmark.

- Boundaries must be specified in order.上下限值的位置不能调换,否则报错;

- Begin and end points are inclusive.包含起始值

```sql

SELECT column_name(s)
FROM table_name
WHERE column_name BETWEEN low_boudary AND high_boudary;

```

## Character String字符串: Seldom少用

- 按照字母顺序alphabetical order，返回开头为特定范围的结果,

- 只需要了解可以这样比较即可，实践中少用；

```sql

-- 返回开头为A-D
SELECT title
    ,pubid
FROM books
WHERE title BETWEEN 'A' AND 'D';

```

需要实验:
1,上下限互转的记过
2，字符串
3，字符村互换
4，日期
5.日期互换
6，not