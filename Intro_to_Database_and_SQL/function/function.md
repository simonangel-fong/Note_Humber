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

[TOP](#function)
