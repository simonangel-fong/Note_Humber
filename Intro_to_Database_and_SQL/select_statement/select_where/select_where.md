[Back](../../index.md)

# 目录
[TOC]

# Select Where Statement

- The `WHERE` clause is optional

- Listed beneath the `FROM` clause

```SQL

SELECT column_name
    ,column_name
    ,column_name
FROM table_name
WHERE column_name operator value;

```

## Column name

- 注意: `WHERE`语句中的列名不能是alias. 注意该特性与在高级select中使用alias相比较.

## Rule for value

- **value is case sensitive.大小写敏感**
    注意: Oracle不是大小写敏感，但value是大小写敏感;
    e.g.: `WHERE lname = 'SMITH'`和`WHERE lname = 'smith'`返回的结果是不同的;


- **Character Strings 字符串: Using **singel** quotation mark.**
    A string literal used as part of a search condition must be **enclosed in single quotaiont marks.**
    e.g.: `WHERE lname = 'Smith'`;
    The use of double quotation mark will raise an error of _invalid idetifier_.


- **Date日期**: 
    must be **enclosed in single quotation marks**.
    e.g.: `WHERE data = '2-Mar-22'`
    日期格式与Date formate设置有关.


- **Number数字: single quotation marks are not required**
    The value in a **numeric column** is not required to be enclosed in single quotes.
    e.g.: `WHERE age = 10`

    - **Exception**: 特例
    When a column is defined as **Varchar2** but none of the values stored in this column contains any letters, in this case only, the value in WHERE clause is not required quotation mark. However, if one of the records in this field contained a letter, the omittion of single quotation makr would return an error.
    如果一个字符类型的列的所有数据都以数字储存，则where语句与数字类型语句要求相同，即无需单引号。但如果其中个数据有字母， 则无单引号的where语句会引起错误.

- **实践**：为避免引号引起的错误,建议搜索前使用`DESC table_name`查询表定义.

***

# Comparison Operator比较运算符

|Operator|Description|
|---|---|
|`=`|Equality, equal to|
|`<>,!=, ^=`|Not equal to|
|`>`|Greater than|
|`>=`|Greater than or equal to|
|`<`|Less than|
|`<=`|Less than or equal to|

- A comparision operator indicates **how the data should relate to a given search value (benchmark)**.

## String: Seldom

- 只需理解SQL可以进行字符串的比较，其比较的是字母顺序alphabetical order.
- 实践中少用；通常是使用不等于号用于筛选。

```sql
-- return a set of data where state name start later than given string "GA"
-- if it is <, it  means the state name start alphabetically earlier than the given string
SELECT firstname
    ,lastname
    ,state
FROM customers
WHERE state > 'GA';

```

- **实践**: 实践多用到不等号. 行业中通用是`<>`.

```sql

SELECT firstname
    ,lastname
    ,state
FROM customers
WHERE state <> 'GA';

```

***

# Calculation Expression

- WHERE语句中，比较运算符两边可以是数学表达式;Arithmetic Expressions can be applied.

```sql
-- 注意:
-- 1. WHERE语句中的column_name列名可以是表达式；
-- 2. column_name不能用alias，下例中只能键入表达式，不能用别名profit
-- 3. value也可以是表达式。

SELECT title
    ,retail-cost AS profit
FROM books
WHERE retail-cost < cost*.2;

```

***

# Advance Comparison Operators其他用于比较的运算符

## [BETWEEN AND](../Select_Where/select_where_between_and.md)

## [IN](../Select_Where/select_where_in.md)

## [LIKE](../Select_Where/select_where_like.md)

## [IS NULL](../Select_Where/select_where_is_null.md)

## [Logical Operator](../Select_Where/select_logical_operator.md)

***

[Top](#目录)
