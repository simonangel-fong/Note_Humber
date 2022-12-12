# Function

[Back](../index.md)

[TOC]

---

## Function 函数

- A `function` is a <u>predefined block of code</u> that accepts one or more arguments.

- An `argument` is a value that is listed within parentheses.

- A function `returns` **a single value** as output.

- `Single-row functions` **return one row of results** for each record processed.

- `Multiple-row functions` **return only one result per group or category** of rows processed, such as counting the number of books published by each publisher

## Nested Functions 嵌套函数

- Any of the <u>single-row functions</u> **can be nested** inside other <u>single-row functions</u>.

- When nesting functions you need to remember the following **rules**:

  - All **arguments** required for each function must be provided. 参数
  - For every **opening parenthesis** there must be a corresponding **closing parenthesis** 括号

- The nested or <u>inner function</u> is evaluated **first**, then the result of the inner function is passed to the outer function and then the outer function is executed. 计算顺序:从里到外.

---

## DUAL Table

一个特殊表,一般用于测试函数.

```SQL
SELECT expression
FROM dual;

```

---

## Function List

- Single-Row Function

  - [Case conversion functions](../function/single-row_function/case_conversion_function.md)

    - [`LOWER`](../function/single-row_function/case_conversion_function.md#lower)
    - [`UPPER`](../function/single-row_function/case_conversion_function.md#upper)
    - [`INITCAP`](../function/single-row_function/case_conversion_function.md#initcap)

  - [Character manipulation functions](../function/single-row_function/character_manipulation_function.md)

    - [`SUBSTR`](../function/single-row_function/character_manipulation_function.md#substr)
    - [`INSTR`](../function/single-row_function/character_manipulation_function.md#instr)
    - [`LENGTH`](../function/single-row_function/character_manipulation_function.md#length)
    - [`LPAD & RPAD`](../function/single-row_function/character_manipulation_function.md#lpad--rpad)
    - [`LTRIM & RTRIM`](../function/single-row_function/character_manipulation_function.md#ltrim--rtrim)
    - [`REPLACE`](../function/single-row_function/character_manipulation_function.md#replace)
    - [`CONCAT`](../function/single-row_function/character_manipulation_function.md#concat)

  - [Numeric functions](../function/single-row_function/numeric_function.md)

    - [`ROUND`](../function/single-row_function/numeric_function.md#round-四舍五入)
    - [`TRUNC`](../function/single-row_function/numeric_function.md#trunc-取整)
    - [`MOD`](../function/single-row_function/numeric_function.md#mod-取余)
    - [`ABS`](../function/single-row_function/numeric_function.md#abs)
    - [`POWER`](../function/single-row_function/numeric_function.md#power)

  - [Date functions](../function/single-row_function/date_function.md)

    - [`MONTHS_BETWEEN`](../function/single-row_function/date_function.md#months_between)
    - [`ADD_MONTHS`](../function/single-row_function/date_function.md#add_months)
    - [`NEXT_DAY`](../function/single-row_function/date_function.md#next_day)
    - [`LAST_DAY`](../function/single-row_function/date_function.md#last_day)
    - [`TO_DATE`](../function/single-row_function/date_function.md#to_date)
    - [`ROUND`](../function/single-row_function/date_function.md#round-四舍五入日期)
    - [`TRUNC`](../function/single-row_function/date_function.md#truncating-date-日期取整)
    - [`SYSDATE`](../function/single-row_function/date_function.md#sysdate)
    - [`CURRENT_TIMESTAMP`](../function/single-row_function/date_function.md#current_timestamp)
    - [`CURRENT_DATE`](../function/single-row_function/date_function.md#current_date)
    - [`SYSTIMESTAMP`](../function/single-row_function/date_function.md#systimestamp)

  - [Other functions](../function/single-row_function/other_function.md)

    - [`NVL`](../function/single-row_function/other_function.md#nvl)
    - [`NVL2`](../function/single-row_function/other_function.md#nvl2)
    - [`TO_CHAR`](../function/single-row_function/other_function.md#to_char)
    - [`DECODE`](../function/single-row_function/other_function.md#decode)
    - [`CASE`](../function/single-row_function/other_function.md#case)
    - [`TO_NUMBER`](../function/single-row_function/other_function.md#to_number)

- Multiple-Row Function

  - [Group Function](../function/multiple-row_function/group_function.md)

    - [SUM](../function/multiple-row_function/group_function.md#sum)
    - [AVG](../function/multiple-row_function/group_function.md#avg)
    - [COUNT](../function/multiple-row_function/group_function.md#count)
    - [MAX](../function/multiple-row_function/group_function.md#max)
    - [MIN](../function/multiple-row_function/group_function.md#min)
    - [Nesting Group Functions](../function/multiple-row_function/group_function.md#nesting-group-functions)

  - [Group By Clause](../function/multiple-row_function/group_by.md)
  - [HAVING Clause](../function/multiple-row_function/group_by.md)

---

[TOP](#function)
